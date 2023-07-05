using System.ComponentModel.DataAnnotations;
namespace Server.DTO;
public class TarefaDTO
{
    public int? tarefaId { get; set; }
    public string? Descricao { get; set; }
    public DateTime? DataInicio { get; set; }
    public DateTime? DataTermino { get; set; }
    public string? Status { get; set; }
    // Funcionario funcionario;
    public ClienteDTO? Cliente { get; set; }
    public DepartamentoDTO? Departamento { get; set; }
    public ProjetoDTO? Projeto { get; set; }
}
