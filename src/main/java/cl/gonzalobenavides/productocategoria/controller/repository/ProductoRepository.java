package cl.gonzalobenavides.productocategoria.controller.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cl.gonzalobenavides.productocategoria.model.Categoria;
import cl.gonzalobenavides.productocategoria.model.Producto;

@Repository
public interface ProductoRepository extends CrudRepository<Producto, Long>{
	List<Producto> findAll();
	List<Producto> findByCategoriasNotContains(Categoria categoria);
}
