using System;
using System.ComponentModel.DataAnnotations;

namespace Server.Models;
public class TarefaModel
{
    [Key]
    public int? tarefaId { get; set; }

    public string? Descricao { get; set; }

    public DateTime? DataInicio { get; set; }

    public DateTime? DataTermino { get; set; }

    public string? Status { get; set; }

    public ClienteModel? Cliente { get; set; }

    public DepartamentoModel? Departamento { get; set; }

    public ProjetoModel? Projeto { get; set; }
}
