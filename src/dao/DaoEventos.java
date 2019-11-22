package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.Eventos;
import connection.SingleConnection;

public class DaoEventos {

	private Connection connection;

	public DaoEventos() {
		connection = SingleConnection.getConnection();

	}


	public List<Eventos> listar() throws Exception {
		List<Eventos> listar = new ArrayList<Eventos>();

		String sql = "select * from eventos" ;

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			Eventos evento = new Eventos();
			evento.setId(resultSet.getString("id"));
			evento.setDescricao(resultSet.getString("descricao"));
			evento.setDataevento(resultSet.getString("dataevento"));
			
			listar.add(evento);

		}
		return listar;
	}

}
