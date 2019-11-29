package com.tolis.springboot.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tolis.springboot.web.model.Todo;
import com.tolis.springboot.web.service.TodoRepository;

@Controller
@SessionAttributes("username")
public class TodoController {

	@Autowired
	private TodoRepository repository;

	//Date format in dd/MM/yyyy
	@InitBinder
	public void iniBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	@RequestMapping(value = "/list-todos", method = RequestMethod.GET)
    public String showListTodosPage(ModelMap model) {
		
		String username = getLoggedInUserName(model);

		model.put("todos", repository.findByUser(username));
		
        return "list-todos";
    }

	
	
	@RequestMapping(value = "/add-todo", method = RequestMethod.GET)
    public String showAddTodoPage(ModelMap model) {

		model.addAttribute("todo", new Todo(0, getLoggedInUserName(model), "Default Desc", new Date(), false));
		
		return "todo";
    }
	
	@RequestMapping(value = "/delete-todo", method = RequestMethod.GET)
    public String deleteTodo(@RequestParam int id) {

		repository.deleteById(id);

		return "redirect:/list-todos";
    }
	
	@RequestMapping(value = "/update-todo", method = RequestMethod.GET)
    public String showUpdateTodoPage(@RequestParam int id, ModelMap model) {

		Optional<Todo> todo = repository.findById(id);
	
		model.put("todo", todo);
		
        return "todo";
    }
	
	@RequestMapping(value = "/update-todo", method = RequestMethod.POST)
    public String updateTodo(@Valid Todo todo, BindingResult result, ModelMap model) {
		
		if(result.hasErrors()) {
			return "todo";
		}
		
		todo.setUser(getLoggedInUserName(model));
		
		repository.save(todo);
	
        return "redirect:/list-todos";
    }

	@RequestMapping(value = "/add-todo", method = RequestMethod.POST)
    public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
		
		//If Validation errors
		if(result.hasErrors()) {
			return "todo";
		}
		
		todo.setUser(getLoggedInUserName(model));
		repository.save(todo);
		
        return "redirect:/list-todos";
    }
	
	private String getLoggedInUserName(ModelMap model) {
		return (String) model.get("username");
	}
}