package cl.gonzalobenavides.productocategoria.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import cl.gonzalobenavides.productocategoria.controller.service.ApiService;
import cl.gonzalobenavides.productocategoria.model.Categoria;
import cl.gonzalobenavides.productocategoria.model.Producto;

@Controller
public class ApiController {

	@Autowired
	ApiService service;
	
	@GetMapping("/")
	public String getIndex() {
		return "index.jsp";
	}
	
	@GetMapping("/products")
	public String getProducts(Model mod) {
		mod.addAttribute("products", service.findAllProductos());
		return "/products/products.jsp";
	}
	
	@GetMapping("/categories")
	public String getCategories(Model mod) {
		mod.addAttribute("categories", service.findAllCategorias());
		return "/categories/categories.jsp";
	}
	
	@GetMapping("/products/new")
	public String newProducto(@ModelAttribute Producto newProduct, BindingResult res, Model mod) {
		mod.addAttribute("newProduct", new Producto());
		return "newProduct.jsp";
	}
	
	@GetMapping("/categories/new")
	public String newCategory(@ModelAttribute Categoria newCat, BindingResult res, Model mod) {
		mod.addAttribute("newCat", new Categoria());
		return "newCategory.jsp";
	}
	
	@GetMapping("/products/{id}/edit")
	public String checkProducto(@ModelAttribute Categoria addCategory, BindingResult res, @PathVariable("id")Long id, Model mod) {
		Producto p = service.findProductoById(id);
		mod.addAttribute("product", p);
		mod.addAttribute("addCategory", addCategory);
		mod.addAttribute("categorias", service.findAllCategorias());
		mod.addAttribute("freeCategorias", service.findAllNotProducto(p));
		return "../product.jsp";
	}
	
	@PostMapping("/products/{id}/edit")
	public String addCategory(@ModelAttribute Categoria addCategory, BindingResult res, @PathVariable("id")Long id, Model mod) {
		if(res.hasErrors())
			return "../product.jsp";
		
		service.addCategoria(id, addCategory.getId());
		
		
		return "redirect:/products/"+id+"/edit";
	}
	
	@GetMapping("/categories/{id}/edit")
	public String checkCategoria(@ModelAttribute Producto addProduct, BindingResult res, @PathVariable("id")Long id, Model mod) {
		Categoria p = service.findCategoriaById(id);
		mod.addAttribute("category", p);
		mod.addAttribute("addProduct", addProduct);
		mod.addAttribute("productos", service.findAllProductos());
		mod.addAttribute("freeProductos", service.findAllNotCategoria(p));
		return "../category.jsp";
	}
	
	@PostMapping("/categories/{id}/edit")
	public String addProduct(@ModelAttribute Producto addProducto, BindingResult res, @PathVariable("id")Long id, Model mod) {
		if(res.hasErrors())
			return "../category.jsp";
		
		service.addProducto(id, addProducto.getId());
		
		return "redirect:/categories/"+id+"/edit";
	}
	
	@PostMapping("/products/new")
	public String agregarProducto(@ModelAttribute Producto newProd, BindingResult res, Model mod) {
		if(res.hasErrors())
			return "newProduct.jsp";
		service.save(newProd);
		return "redirect:/products";
	}
	
	@PostMapping("/categories/new")
	public String agregarCategoria(@ModelAttribute Categoria newCat, BindingResult res, Model mod) {
		if(res.hasErrors())
			return "newCategory.jsp";
		service.save(newCat);
		return "redirect:/categories";
	}
	
}
