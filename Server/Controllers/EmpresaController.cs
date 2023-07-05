using Microsoft.AspNetCore.Mvc;
using Server.DTO;
using Server.Models;
[ApiController]
[Route("/empresa")]
public class EmpresaController : ControllerBase
{
    private Db _context;
    public EmpresaController(Db context)
    {
        _context = context;
    }

    [HttpGet("/empresa/{id}")]
    public IActionResult Find(int id)
    {
        return Ok(_context.Empresa!.Find(id));
    }
    [HttpGet]
    public IActionResult GetAll()
    {
        return Ok(_context.Empresa!.ToList());
    }

    [HttpPost]
    public IActionResult Create(EmpresaDTO dto)
    {
        try
        {
            var Empresa = new EmpresaModel()
            {
                Endereco = dto.Endereco,
                Nome = dto.Nome,
                Telefone = dto.Nome,
                empresaId = _context.Empresa!.Max(table => table.empresaId) + 1
            };
            _context.Empresa!.Add(Empresa);
            _context.SaveChanges();
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }

    [HttpPut]
    public IActionResult Update(EmpresaDTO dTO)
    {
        try
        {
            var empresa = _context.Empresa!.Find(dTO.empresaId)!;
            empresa.Nome = dTO.Nome;
            empresa.Endereco = dTO.Endereco;
            empresa.Telefone = dTO.Telefone;

            _context.SaveChanges();
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }
    [HttpDelete("/empresa/{id}")]
    public IActionResult Delete(int id)
    {
        var empresa = _context.Empresa!.Find(id);
        if (empresa == null)
            return NotFound();
        _context.Empresa!.Remove(empresa);
        return Ok();
    }
}