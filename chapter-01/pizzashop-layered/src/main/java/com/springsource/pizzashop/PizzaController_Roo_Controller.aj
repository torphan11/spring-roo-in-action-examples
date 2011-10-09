// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.pizzashop;

import com.springsource.pizzashop.domain.Base;
import com.springsource.pizzashop.domain.Pizza;
import com.springsource.pizzashop.domain.Topping;
import com.springsource.pizzashop.service.BaseService;
import com.springsource.pizzashop.service.PizzaService;
import com.springsource.pizzashop.service.ToppingService;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PizzaController_Roo_Controller {
    
    @Autowired
    PizzaService PizzaController.pizzaService;
    
    @Autowired
    BaseService PizzaController.baseService;
    
    @Autowired
    ToppingService PizzaController.toppingService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String PizzaController.create(@Valid Pizza pizza, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pizza", pizza);
            return "pizzas/create";
        }
        uiModel.asMap().clear();
        pizzaService.savePizza(pizza);
        return "redirect:/pizzas/" + encodeUrlPathSegment(pizza.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PizzaController.createForm(Model uiModel) {
        uiModel.addAttribute("pizza", new Pizza());
        return "pizzas/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PizzaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("pizza", pizzaService.findPizza(id));
        uiModel.addAttribute("itemId", id);
        return "pizzas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PizzaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pizzas", pizzaService.findPizzaEntries(firstResult, sizeNo));
            float nrOfPages = (float) pizzaService.countAllPizzas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pizzas", pizzaService.findAllPizzas());
        }
        return "pizzas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PizzaController.update(@Valid Pizza pizza, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pizza", pizza);
            return "pizzas/update";
        }
        uiModel.asMap().clear();
        pizzaService.updatePizza(pizza);
        return "redirect:/pizzas/" + encodeUrlPathSegment(pizza.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PizzaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("pizza", pizzaService.findPizza(id));
        return "pizzas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PizzaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Pizza pizza = pizzaService.findPizza(id);
        pizzaService.deletePizza(pizza);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pizzas";
    }
    
    @ModelAttribute("bases")
    public Collection<Base> PizzaController.populateBases() {
        return baseService.findAllBases();
    }
    
    @ModelAttribute("pizzas")
    public Collection<Pizza> PizzaController.populatePizzas() {
        return pizzaService.findAllPizzas();
    }
    
    @ModelAttribute("toppings")
    public Collection<Topping> PizzaController.populateToppings() {
        return toppingService.findAllToppings();
    }
    
    String PizzaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}