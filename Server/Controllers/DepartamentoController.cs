using Microsoft.AspNetCore.Mvc;
using Server.DTO;
using Server.Models;
[ApiController]
[Route("/departamento")]
public class DepartamentoController : ControllerBase
{
    private Db _context;
    public DepartamentoController(Db context)
    {
        _context = context;
    }

    [HttpGet("/departamento/{id}")]
    public IActionResult Find(int id)
    {
        return Ok(_context.Departamento!.Find(id));
    }
    [HttpGet]
    public IActionResult GetAll()
    {
        return Ok(_context.Departamento!.ToList());
    }

    [HttpPost]
    public IActionResult Create(DepartamentoDTO dto)
    {
        try
        {
            var departamento = new DepartamentoModel()
            {
                Descricao = dto.Descricao,
                Nome = dto.Nome,
                departamentoId = _context.Departamento!.Max(table => table.departamentoId) + 1
            };
            _context.Departamento!.Add(departamento);
            _context.SaveChanges();
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }

    [HttpPut("/departamento/{id}")]
    public IActionResult Update(DepartamentoDTO dTO)
    {
        try
        {
            var departamento = _context.Departamento!.Find(dTO.departamentoId)!;
            departamento.departamentoId = dTO.departamentoId;
            departamento.Descricao = dTO.Descricao;
            departamento.Nome = dTO.Nome;
            _context.SaveChanges();
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }

    [HttpDelete("/departamento/{id}")]
    public IActionResult Delete(int id)
    {
        try{
        var dapartamento = _context.Departamento!.Find(id);
        if (dapartamento == null)
            return NotFound();
        _context.Departamento!.Remove(dapartamento);
        _context.SaveChanges();
        return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }
}