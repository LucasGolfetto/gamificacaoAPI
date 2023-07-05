using Microsoft.AspNetCore.Mvc;
using Server.DTO;
using Server.Models;
namespace Server.Controllers;

[ApiController]
[Route("/tarefa")]
public class TarefaController : ControllerBase
{
    private Db _context;

    public TarefaController(Db context)
    {
        _context = context;
    }
    [HttpGet]
    public IActionResult GetAll()
    {
        return Ok(_context.Tarefa!.ToArray());
    }

    [HttpGet("/tarefa/{id}")]
    public IActionResult Find(int id)
    {
        var tarefa = _context.Tarefa!.Find(id);
        if (tarefa == null)
        {
            return NotFound();
        }
        return Ok(tarefa);
    }

    [HttpPut]
    public IActionResult Update(TarefaDTO dTO)
    {
        var tarefa = _context.Tarefa!.Find(dTO.tarefaId);
        if (tarefa == null)
            return NotFound();
        tarefa.Descricao = dTO.Descricao;
        tarefa.DataInicio = dTO.DataInicio;
        tarefa.DataTermino = dTO.DataTermino;
        tarefa.Status = dTO.Status;
        tarefa.Cliente = _context.Cliente!.Find(dTO.Cliente!.clienteId!);
        tarefa.Departamento = _context.Departamento!.Find(dTO.Departamento!.departamentoId!)!;
        tarefa.Projeto = _context.Projeto!.Find(dTO.Projeto!.projetoId!)!;
        _context.SaveChanges();
        return Ok();
    }

    [HttpDelete("/tarefa/{id}")]
    public IActionResult Remove(int id)
    {
        var tarefa = _context.Tarefa!.Find(id);
        if (tarefa == null)
            return NotFound();
        _context.Tarefa.Remove(tarefa);
        return Ok();
    }

    [HttpPost]
    public IActionResult Create(TarefaDTO dto)
    {
        try
        {
            var tarefa = new TarefaModel()
            {
                tarefaId = _context.Tarefa!.Max(table => table.tarefaId) + 1,
                Cliente = _context.Cliente!.Find(dto.Cliente!.clienteId!),
                Descricao = dto.Descricao,
                DataInicio = dto.DataInicio,
                DataTermino = dto.DataTermino,
                Status = dto.Status,
                Departamento = _context.Departamento!.Find(dto.Departamento!.departamentoId!),
                Projeto = _context.Projeto!.Find(dto.Projeto!.projetoId!),
            };
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }
}
