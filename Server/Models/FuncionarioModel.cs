using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace Server.Models;

public class FuncionarioModel
{
    [Key]
    public int? funcionarioId { get; set; }

    public string? Nome { get; set; }

    public string? Sobrenome { get; set; }

    public string? Endereco { get; set; }

    public string? Telefone { get; set; }

    public List<TarefaModel>? Tarefas { get; set; }
}
