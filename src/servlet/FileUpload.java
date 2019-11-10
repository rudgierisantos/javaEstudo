package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoUsuario;

@WebServlet("/pages/fileUpload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoUsuario daoUsuario = new DaoUsuario();
  
    public FileUpload() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		//Usar variável fileUpload para salvar no banco de dados
		String fileUpload = request.getParameter("fileUpload");
		//Nesse momento faz o insert no banco de dados.
		
		daoUsuario.gravarImagem(fileUpload);
		
		response.getWriter().write("Upload Realizado com Sucesso");
		
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Erro Fatal ao realizar o upload");
		}
	}

}
