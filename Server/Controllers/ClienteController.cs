using Microsoft.AspNetCore.Mvc;
using Server.DTO;
using Server.Models;
[ApiController]
[Route("/cliente")]
public class ClienteController : ControllerBase
{
    private Db _context;

    public ClienteController(Db context)
    {
        _context = context;
    }

    [HttpGet("/cliente/{id}")]
    public IActionResult Find(int id)
    {
        return Ok(_context.Cliente!.Find(id));
    }

    [HttpGet]
    public IActionResult GetAll()
    {
        return Ok(_context.Cliente!.ToList());
    }

    [HttpPost]
    public IActionResult Create(ClienteDTO dTO)
    {
        var cliente = new ClienteModel()
        {
            Nome = dTO.Nome,
            Sobrenome = dTO.Sobrenome,
            Endereco = dTO.Endereco,
            Telefone = dTO.Telefone,
            clienteId = _context.Cliente!.Max(table => table.clienteId) + 1
        };
        try
        {
            _context.Cliente!.Add(cliente);
            _context.SaveChanges();
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }

    [HttpPut]
    public IActionResult Update(ClienteDTO dTO)
    {
        try
        {
            var cliente = _context.Cliente!.Find(dTO.clienteId)!;
            cliente.Endereco = dTO.Endereco;
            _context.SaveChanges();
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }
    [HttpDelete("/cliente/{id}")]
    public IActionResult Delete(int id)
    {
        var cliente = _context.Cliente!.Find(id);
        if (cliente == null)
            return NotFound();
        _context.Cliente!.Remove(cliente);
        return Ok();
    }
}