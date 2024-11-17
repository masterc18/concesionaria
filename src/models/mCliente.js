const connection = require("../config/Conn");

class mCliente {
    async registrar(cliente) {
        const clienteGrd = await connection.query("INSERT INTO cliente  usuario_id = ?", [cliente.usuario_id]);
        return clienteGrd;
    }
    async obtnerTodos() {
        const [clientes] = await connection.query("SELECT * FROM cliente c INNER JOIN usuario u ON c.usuario_id = u.id");
        return clientes
    }
    async eliminar(usuario_id) {
        const clienteElmd = await connection.query("DELETE FROM cliente WHERE usuario_id = ?", [usuario_id])
        return clienteElmd
    }
}

module.exports = mCliente;