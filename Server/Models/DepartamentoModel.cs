using System.ComponentModel.DataAnnotations;
namespace Server.Models;
public class DepartamentoModel
{
    [Key]
    public int? departamentoId { get; set; }

    public string? Nome { get; set; }

    public string? Descricao { get; set; }
}
