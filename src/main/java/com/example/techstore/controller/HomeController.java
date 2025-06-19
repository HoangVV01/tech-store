package com.example.techstore.controller;

import com.example.techstore.model.Category;
import com.example.techstore.model.Product;
import com.example.techstore.service.CategoryService;
import com.example.techstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private final ProductService productService;
    private CategoryService categoryService;

    // Use constructor injection
    public HomeController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }
    @GetMapping("/")
    public String getProducts(
            @RequestParam(required = false) String search,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            Model model) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage;

        // If the search term is provided, use it to filter products
        if (search != null && !search.isEmpty()) {
            productPage = productService.searchProductsByName(search, pageable);
        } else {
            // Otherwise, show all products
            productPage = productService.getAllProducts(pageable);
        }

        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());

        // Add the search term back to the model to keep it in the search bar
        model.addAttribute("search", search);

        // Fetch categories from the service
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);

        return "index";
    }
}
