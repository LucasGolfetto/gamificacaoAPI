using System.ComponentModel.DataAnnotations;
namespace Server.Models;
public class ClienteModel
{
    [Key]
    public int? clienteId { get; set; }

    public string? Nome { get; set; }

    public string? Sobrenome { get; set; }

    public string? Endereco { get; set; }

    public string? Telefone { get; set; }
}
