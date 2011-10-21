// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.rooinaction.cmsapp.web;

import com.rooinaction.cmsapp.domain.Student;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect StudentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String StudentController.create(@Valid Student student, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("student", student);
            return "students/create";
        }
        student.persist();
        return "redirect:/students/" + encodeUrlPathSegment(student.get_id().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String StudentController.createForm(Model model) {
        model.addAttribute("student", new Student());
        return "students/create";
    }
    
    @RequestMapping(value = "/{_id}", method = RequestMethod.GET)
    public String StudentController.show(@PathVariable("_id") Long _id, Model model) {
        model.addAttribute("student", Student.findStudent(_id));
        model.addAttribute("itemId", _id);
        return "students/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String StudentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("students", Student.findStudentEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Student.countStudents() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("students", Student.findAllStudents());
        }
        return "students/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String StudentController.update(@Valid Student student, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("student", student);
            return "students/update";
        }
        student.merge();
        return "redirect:/students/" + encodeUrlPathSegment(student.get_id().toString(), request);
    }
    
    @RequestMapping(value = "/{_id}", params = "form", method = RequestMethod.GET)
    public String StudentController.updateForm(@PathVariable("_id") Long _id, Model model) {
        model.addAttribute("student", Student.findStudent(_id));
        return "students/update";
    }
    
    @RequestMapping(value = "/{_id}", method = RequestMethod.DELETE)
    public String StudentController.delete(@PathVariable("_id") Long _id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Student.findStudent(_id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/students?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    String StudentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
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