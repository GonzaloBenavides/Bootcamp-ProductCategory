package cl.gonzalobenavides.productocategoria.controller.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.gonzalobenavides.productocategoria.controller.repository.CategoriaRepository;
import cl.gonzalobenavides.productocategoria.controller.repository.ProductoRepository;
import cl.gonzalobenavides.productocategoria.model.Categoria;
import cl.gonzalobenavides.productocategoria.model.Producto;

@Service
public class ApiService {

	@Autowired
	ProductoRepository productoRepo;
	
	@Autowired
	CategoriaRepository categoriaRepo;
	
	public void save(Producto prod) {
		productoRepo.save(prod);
	}
	
	public void save(Categoria cat) {
		categoriaRepo.save(cat);
	}
	
	public void delete(Categoria cat) {
		categoriaRepo.delete(cat);
	}
	
	public void delete(Producto prod) {
		productoRepo.delete(prod);
	}
	
	public List<Producto> findAllProductos() {
		return productoRepo.findAll();
	}
	
	public List<Categoria> findAllCategorias(){
		return categoriaRepo.findAll();
	}
	
	public List<Categoria> findAllNotProducto(Producto product){
		return categoriaRepo.findByProductosNotContains(product);
	}
	
	public List<Producto> findAllNotCategoria(Categoria categoria){
		return productoRepo.findByCategoriasNotContains(categoria);
	}
	
	public Producto findProductoById(Long id) {
		Optional<Producto> opt = productoRepo.findById(id);
		if(opt.isPresent())
			return opt.get();
		else
			return null;
	}
	
	public Categoria findCategoriaById(Long id) {
		Optional<Categoria> opt = categoriaRepo.findById(id);
		if(opt.isPresent())
			return opt.get();
		else
			return null;
	}
	
	public void addCategoria(Long idProducto,Long idCategoria) {
		Producto pro = this.findProductoById(idProducto);
		Categoria categoria = this.findCategoriaById(idCategoria);
		categoria.addProducto(pro);
		pro.addCategoria(categoria);
		
		productoRepo.save(pro);
	}
	
	public void addProducto(Long id, Long idProducto) {
		Categoria cat = this.findCategoriaById(id);
		Producto producto = this.findProductoById(idProducto);
		cat.addProducto(producto);
		producto.addCategoria(cat);
		
		categoriaRepo.save(cat);
	}
}
