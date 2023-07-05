using System.ComponentModel.DataAnnotations;
namespace Server.DTO;

public class ProjetoDTO
{
    public int? projetoId { get; set; }
    public string? Nome { get; set; }
    public string? Descricao { get; set; }
    public DateTime? DataInicio { get; set; }
    public DateTime? DataTermino { get; set; }
}
