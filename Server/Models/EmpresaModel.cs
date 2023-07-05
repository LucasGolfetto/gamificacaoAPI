using System.ComponentModel.DataAnnotations;
namespace Server.Models;
public class EmpresaModel
{
    [Key]
    public int? empresaId { get; set; }

    public string? Nome { get; set; }

    public string? Endereco { get; set; }

    public string? Telefone { get; set; }
}
