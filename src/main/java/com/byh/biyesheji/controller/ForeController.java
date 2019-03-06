package com.byh.biyesheji.controller;

import com.byh.biyesheji.pojo.*;
import com.byh.biyesheji.service.*;
import com.byh.biyesheji.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 前台所有请求controller
 */
@Controller
@RequestMapping("/fore")
public class ForeController {

    @Autowired
    private ForeService foreService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ZiXunService ziXunService;

    public String PNAME=null;

    /**
     * 前台首页
     * @param model
     * @return
     */
    @RequestMapping("/foreIndex")
    public String index(Model model, HttpSession session){

        //传入3个分类
        List<Category> categories = foreService.listToThree();
        List<Category> categories1 = categoryService.list();
        //给每个分类设置商品
        for (Category c:categories){
            List<Product> products = productService.getProductsByCid(c.getId());
            //如果分类下的商品超过4个，则只显示4个给前端
            if(products.size()>5){
                List<Product> products1 = new ArrayList<Product>();
                for(int i=0;i<=4;i++){
                    products1.add(products.get(i));
                }
                c.setProducts(products1);
            }else{
                c.setProducts(products);
            }
        }
        model.addAttribute("categories",categories);
        session.setAttribute("categories",categories1); //保存在session  使其他页面也能获取到分类列表 而不用每次都去查询
        return "forepage/index2";
    }


    /**
     * 商品详情跳转
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/foreDetailUI")
    public String detailUI(@RequestParam(value = "id")int id, Model model){
        Product product = productService.get(id);
        if(product==null) return "forepage/noPro";

        User user = productService.getUserByBid(product.getBid());
        Category category = productService.getCategoryByCid(product.getCid());
        product.setCategory(category);
        product.setUser(user);

        List<Product> fivePro = foreService.getFivePro();

        model.addAttribute("product",product);
        model.addAttribute("fivePro",fivePro);

        List<Review> list = reviewService.getReviewListByPid(id);
        model.addAttribute("reviews",list);
        model.addAttribute("rs",list.size());

        return "forepage/proDetail";
    }

    /**
     * 注册页面
     * @return
     */
    @RequestMapping("/foreRegisterUI")
    public String registerUI(){
        return "forepage/foreRegister";
    }

    /**
     * 登陆页面
     * @return
     */
    @RequestMapping("/foreLoginUI")
    public String foreLoginUI(){
        return "forepage/forelogin";
    }

    /**
     * 模态窗口登陆 验证
     * @param customer
     * @param session
     * @return
     */
    @RequestMapping("/foreMtLogin")
    @ResponseBody
    public String foreIsLogin(Customer customer, HttpSession session){
        Customer cst = customerService.foreLogin(customer);
        if(null==cst){
            return "false";
        }
        session.setAttribute("cst", cst);
        return "true";
    }

    /**
     * ajax判断客户是否登陆
     * @param session
     * @return
     */
    @RequestMapping("/foreIsLogin")
    @ResponseBody
    public String isLogin(HttpSession session){
        Customer cst = (Customer) session.getAttribute("cst");
        return cst==null?"false":"true";
    }

    /**
     * 注册
     * @param customer
     * @return
     */
    @RequestMapping("/foreRegister")
    public String register(Customer customer){
        customer.setStatus(0);
        customerService.save(customer);
        return "forepage/registerSuccess";
    }

    /**
     * 客户登陆
     * @param customer
     * @param session
     * @return
     */
    @RequestMapping("/foreLogin")
    public String foreLogin(Customer customer, HttpSession session, Model model){
        Customer cst = customerService.foreLogin(customer);
        if (cst!=null){
            session.setAttribute("cst",cst);
            return "redirect:foreIndex";
        }else {
            return "redirect:foreLoginMsg";
        }
    }

    /**
     * 用户登陆返回信息
     * @return
     */
    @RequestMapping("/foreLoginMsg")
    public String foreLoginMsg(HttpServletRequest request){
        request.setAttribute("msg","true");
        return "forepage/forelogin";
    }

    /**
     * 客户注销
     * @param session
     * @return
     */
    @RequestMapping("/foreCstLoginOut")
    public String cstLoginOut(HttpSession session){
        session.setAttribute("cst",null);
        return "redirect:foreIndex";
    }

    /**
     * 立即购买
     * @param session
     * @param pid  商品id
     * @param number  商品数量
     * @return  重定向到支付 ， 传入订单项id
     */
    @RequestMapping("/forebuyone")
    public String forebuyone(HttpSession session, int pid, int number, float totalPrice){
        Customer cst = (Customer) session.getAttribute("cst");
        Product product = productService.get(pid);

        int oiid = 0;

        boolean find = false;
        List<OrderItem> orderItems = orderItemService.listByCustomer(cst.getId());//获得订单项表中该用户的所有订单id为空的订单项
        for (OrderItem oi : orderItems) {
            //基于用户对象customer，查询没有生成订单的订单项集合
            // 如果产品是一样的话，就进行数量追加
            if(oi.getProduct().getId().intValue()==product.getId().intValue()){
                //如果已经存在这个产品对应的OrderItem，并且还没有生成订单，即还在购物车中。 那么就应该在对应的OrderItem基础上，调整数量
                oi.setNumber(oi.getNumber()+number);
                orderItemService.update(oi);
                find = true;
                //获取这个订单项的 id
                oiid = oi.getId();
                break;
            }
        }
        //如果不存在对应的OrderItem,那么就新增一个订单项OrderItem
        if(!find){
            OrderItem oi = new OrderItem();
            oi.setCstid(cst.getId());
            oi.setNumber(number);
            oi.setPid(pid);
            orderItemService.save(oi);
            //获取这个刚添加的订单项的 id
            oiid = oi.getId();
        }

        return "redirect:forebuy?oiid="+oiid;
    }

    /**
     * 立即购买、购物车提交到订单页面调用  根据oiid计算订单项的总价、购买数量 ， 订单项放session
     * 订单-支付  上一次的购物信息会被下次单个挤掉  根据oiid获得订单项
     * @param model
     * @param oiid 立即购买生成的订单项id
     * @param session
     * @return 返回订单项集合   |   返回所有订单项加起来的总价
     */
    @RequestMapping("/forebuy")
    public String forebuy(Model model, String[] oiid, HttpSession session){
        System.out.println(oiid);

        List<OrderItem> ois = new ArrayList<OrderItem>();

        Customer cst = (Customer)session.getAttribute("cst");

        float total = 0;
        int number = 0;
        for (String strid : oiid) {
            int id = Integer.parseInt(strid);
            OrderItem oi= orderItemService.get(id);
            if (cst.getStatus()==1){
                total +=oi.getProduct().getPrice()*0.8*oi.getNumber();
            }else{
                total +=oi.getProduct().getPrice()*oi.getNumber();
            }
            number += oi.getNumber();
            ois.add(oi);
        }
        /*
          累计这些ois的价格总数，赋值在total上
          把订单项集合放在session的属性 "ois" 上,方便下订单时候直接获取
          把总价格放在 model的属性 "total" 上
          服务端跳转到buy.jsp
          */
        session.setAttribute("ois", ois);
        model.addAttribute("total", total);
        model.addAttribute("number", number);

        return "forepage/foreBuy";
    }

    /**
     * 添加购物车
     * @param pid  商品id
     * @param number  购买数量
     * @param model
     * @param session
     * @return  boolean
     */
    @RequestMapping("/foreAddCart")
    @ResponseBody
    public String addCart(int pid, int number, Model model, float totalPrice, HttpSession session) {
        Customer customer =(Customer)  session.getAttribute("cst");
        if(customer==null){
            return "false";
        }
        Product p = productService.get(pid);

        boolean found = false;
        //获得订单项表中该用户的所有订单id为空的订单项
        List<OrderItem> ois = orderItemService.listByCustomer(customer.getId());
        for (OrderItem oi : ois) {
            //基于用户对象customer，查询没有生成订单的订单项集合
            // 如果产品是一样的话，就进行数量追加
            if(oi.getProduct().getId().intValue()==p.getId().intValue()){
                //如果已经存在这个产品对应的OrderItem，并且还没有生成订单，即还在购物车中。 那么就应该在对应的OrderItem基础上，调整数量
                oi.setNumber(oi.getNumber()+number);
                orderItemService.update(oi);
                found = true;
                break;
            }
        }
        //如果不存在对应的OrderItem,那么就新增一个订单项OrderItem
        if(!found){
            OrderItem oi = new OrderItem();
            oi.setCstid(customer.getId());
            oi.setNumber(number);
            oi.setPid(pid);
            orderItemService.save(oi);
        }

        return "success";
    }

    /**
     * 查看购物车购物车
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/forecart")
    public String cart(Model model, HttpSession session) {
        Customer customer =(Customer)  session.getAttribute("cst");
        //cstid等于当前登陆用户id 并且oid为null的订单项
        List<OrderItem> ois = orderItemService.listByCustomer(customer.getId());
        //购物车没有商品
        if(ois==null || ois.size()==0){
            return "forepage/cart_noPro";
        }
        int totalProductNumber = 0;
        for (OrderItem oi:ois){
            totalProductNumber += oi.getNumber();
        }
        model.addAttribute("ois", ois);
        model.addAttribute("size", totalProductNumber);

        return "forepage/foreCart";
    }

    /**
     * 删除订单项
     * @param oiid 订单项id
     * @param session
     * @return
     */
    @RequestMapping("/foreDelOrderItem")
    @ResponseBody
    public String foreDelOrderItem(int oiid, HttpSession session){
        Customer customer = (Customer) session.getAttribute("cst");
        if(customer==null){
            return "noSuccess";
        }
        orderItemService.del(oiid);
        return "success";
    }

    /*
      点击提交订单
    1. 从session中获取cst对象
    2. 通过参数Order接受收货人
    3. 根据当前时间加上一个4位随机数生成订单号
    4. 根据上述参数，创建订单对象
    5. 把订单状态设置为未支付
    6. 从session中获取订单项集合 ( 在结算功能的ForeController.buy() 13行，订单项集合被放到了session中 )
    7. 把订单加入到数据库，并且遍历订单项集合，设置每个订单项的order，更新到数据库
    8. 统计本次订单的总金额
    9. 客户端跳转到确认支付页forePayed，并带上订单id和总金额
     */
    @RequestMapping("/foreCreateOrder")
    public String createOrder(Model model, String address, HttpSession session){
        /*
          提交订单后，设置code，客户id，支付状态，地址
         */
        Order order = new Order();
        Customer customer =(Customer)  session.getAttribute("cst");
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
        order.setCode(orderCode);
        order.setAddress(address);
        order.setCstid(customer.getId());
        order.setStatus(0);//未支付

        List<OrderItem> ois= (List<OrderItem>)  session.getAttribute("ois");
        //给每个订单项设置订单id  并且算出订单总价
        float total =orderService.add(order,ois);
        return "redirect:forePayed?oid="+order.getId() +"&total="+total;
    }

    /**
     * 支付成功跳转
     * @param oid 订单id
     * @param total 总价
     * @param model
     * @return
     */
    @RequestMapping("/forePayed")
    public String payed(int oid, float total, Model model) {
        Order order = orderService.get(oid);
        order.setStatus(1);
        orderService.update(order);
        model.addAttribute("total", total);

        return "forepage/forePayed";
    }

    /**
     * 我的订单  根据session查看当前用户的订单
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/forebought")
    public String forebought(Model model, HttpSession session){
        Customer customer = (Customer) session.getAttribute("cst");
        List<Order> os= orderService.list(customer.getId());

        //给每个订单的订单项设置属性值，如orderitem、product
        orderItemService.fill(os);

        model.addAttribute("os", os);
        return "forepage/foreBought";
    }

    /**
     * 搜索商品
     * @param model
     * @param pName
     * @return
     */
    @RequestMapping("/foreNameLike")
    public String foreNameLike(Model model, String pName, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());//分页查询
        if(pName!=null) PNAME = pName;
        List<Product> products = productService.findByName(PNAME);
        int total = (int) new PageInfo<Product>(products).getTotal();//总条数
        page.setTotal(total);

        model.addAttribute("products",products);
        model.addAttribute("total",total);
        model.addAttribute("page", page);

        model.addAttribute("proSize",products.size());

        return "forepage/proSeach";
    }

    /**
     * 显示分类下的商品
     * @param model
     * @param cid
     * @return
     */
    @RequestMapping("/foreFindCategory")
    public String foreFindCategory(Model model, @RequestParam(value = "id") int cid){
        List<Product> ps = productService.findByCid(cid);
        Category category = categoryService.get(cid);
        if(ps.size()>8){
            List<Product> ps1 = new ArrayList<Product>();
            for(int i=0;i<8;i++){
                ps1.add(ps.get(i));
            }
            model.addAttribute("products",ps1);
            model.addAttribute("category",category);
            return "forepage/proCategorySeach";
        }
        model.addAttribute("products",ps);
        model.addAttribute("proSize",ps.size());
        model.addAttribute("category",category);

        return "forepage/proCategorySeach";
    }

    @RequestMapping("/faq")
    public String faq(){
        return "forepage/faq";
    }

    /**
     * 商品评价
     * @param pid
     * @param model
     * @return
     */
    @RequestMapping("/forePingjia")
    public String forePingjia(int pid, Model model){

        return "forePage/pingjia";
    }

    /**
     * 商品评论
     * @param session
     * @param pid
     * @param content
     * @return
     */
    @RequestMapping("/cstPinglun")
    @ResponseBody
    public String cstPinglun(HttpSession session, int pid, String content){
        Customer cst = (Customer) session.getAttribute("cst");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sdf.format(new Date());
        //string转date
        ParsePosition pos = new ParsePosition(0);
        Date strtodate = sdf.parse(format, pos);

        Review review = new Review();
        review.setCstid(cst.getId());
        review.setCustomer(cst);
        review.setPid(pid);
        review.setProduct(productService.get(pid));
        review.setContent(content);
        review.setCreatetime(strtodate);

        reviewService.save(review);

        return "success";
    }

    /**
     * 已审核的资讯
     * @param model
     * @return
     */
    @RequestMapping("/foreZixuns")
    public String zixun(Model model){
        List<ZiXun> list = ziXunService.list();
        model.addAttribute("list",list);
        return "forepage/foreZixun";
    }

    @RequestMapping("/foreZixunadd")
    @ResponseBody
    public String zixunadd(String content, HttpSession session){
        Customer c = (Customer) session.getAttribute("cst");
        ZiXun z = new ZiXun();
        z.setCstid(c.getId());
        z.setContent(content);
        z.setFabudate(new Date());
        z.setStatus(0);
        ziXunService.save(z);
        return "success";
    }

}
