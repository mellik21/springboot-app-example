package com.mellik21.example.controller;

import com.mellik21.example.model.Message;
import com.mellik21.example.model.User;
import com.mellik21.example.repos.MessageRepository;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    //Autowired - устаревшая аннотация ?
    private final MessageRepository messageRepository;

    public MainController(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false,defaultValue = "")String filter,
            Model model) {
        Iterable<Message> messages = messageRepository.findAll();

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
        } else {
            messages = messageRepository.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }

    //  Ищет поля по имени которое указано(text, tag)
    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text, @RequestParam String tag, Map<String, Object> model) {
        Message message = new Message(text, tag, user);
        messageRepository.save(message);

        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "main";
    }

}