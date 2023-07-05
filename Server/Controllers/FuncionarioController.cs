using Microsoft.AspNetCore.Mvc;
using Server.DTO;
using Server.Models;
namespace Server.Controllers
{
    [ApiController]
    [Route("/funcionario")]
    public class FuncionarioController : ControllerBase
    {
        private Db _context;

        public FuncionarioController(Db context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult getAll()
        {
            return Ok(_context.Funcionario!.ToArray());
        }

        [HttpGet("/funcionario/{id}")]
        public IActionResult find(int id)
        {
            var funcionario = _context.Funcionario!.Find(id);
            if (funcionario == null)
            {
                return NotFound();
            }
            return Ok(funcionario);
        }

        [HttpPut]
        public IActionResult update(FuncionarioDTO dTO)
        {
            var funcionario = _context.Funcionario!.Find(dTO.funcionarioId);
            if (funcionario == null)
                return NotFound();
            funcionario.Endereco = dTO.Endereco;
            funcionario.Nome = dTO.Nome;
            funcionario.Sobrenome = dTO.Sobrenome;
            funcionario.Telefone = dTO.Telefone;
            //funcionario.Tarefas = _context.Tarefas!.Find(dTO.Tarefas.TarefasId);
            _context.SaveChanges();
            return Ok();
        }

        [HttpDelete("/funcionario/{id}")]
        public IActionResult remove(int id)
        {
            var funcionario = _context.Funcionario!.Find(id);
            if (funcionario == null)
                return NotFound();
            _context.Funcionario.Remove(funcionario);
            return Ok();
        }

        [HttpPost]
        public IActionResult Create(FuncionarioDTO dto)
        {
            var funcionario = new FuncionarioModel()
            {
                funcionarioId = _context.Funcionario!.Max(table => table.funcionarioId),
                Endereco = dto.Endereco,
                Nome = dto.Nome,
                Sobrenome = dto.Sobrenome,
                Telefone = dto.Telefone,
                Tarefas = new List<TarefaModel>()
            };
            _context.Funcionario!.Add(funcionario);
            return StatusCode(201);
        }
    }
}