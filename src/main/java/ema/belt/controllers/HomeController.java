package ema.belt.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import ema.belt.models.LoginUser;
import ema.belt.models.User;
import ema.belt.services.UserService;

@Controller
public class HomeController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
        BindingResult result, Model model, HttpSession session) {
        User user = userService.register(newUser, result);
        
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());
        session.setAttribute("user", user);
        return "redirect:/classes";
    }
    
    @GetMapping("/home")
    public String home(HttpSession session){
        if(session.getAttribute("userId") == null){
            return "redirect:/logout";
        }
        return "classes/classes.jsp";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        
        return "redirect:/";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
    BindingResult result, Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
        System.out.println(user);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());
        session.setAttribute("user", user);
    
        return "redirect:/classes";
    }
    
}
