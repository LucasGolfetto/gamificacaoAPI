
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;
using Server.Models;

public class Db : DbContext
{
    // Defina suas entidades como DbSet
    public DbSet<ClienteModel>? Cliente { get; set; }
    public DbSet<DepartamentoModel>? Departamento { get; set; }
    public DbSet<EmpresaModel>? Empresa { get; set; }
    public DbSet<FuncionarioModel>? Funcionario { get; set; }    
    public DbSet<ProjetoModel>? Projeto { get; set; }
    public DbSet<TarefaModel>? Tarefa { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var serverVersion = new MySqlServerVersion(new Version(8, 0, 31)); // Especifique a versão correta do servidor MySQL aqui

        optionsBuilder.UseMySql("Server=database;Port=3306;Database=tarefas;User=root;Password=tarefas;",
            serverVersion,
            options => options.EnableRetryOnFailure());
    }

    
    /*protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Configurações para a classe Cliente
        modelBuilder.Entity<Cliente>(entity =>
        {
            entity.HasKey(c => c.Id);
            entity.Property(c => c.Id).ValueGeneratedOnAdd().IsRequired();
            entity.Property(c => c.Nome);
            entity.Property(c => c.Sobrenome);
            entity.Property(c => c.Endereco);
            entity.Property(c => c.Telefone);
        });

        // Configurações para a classe Departamento
        modelBuilder.Entity<Departamento>(entity =>
        {
            entity.HasKey(d => d.Id);
            entity.Property(d => d.Id).ValueGeneratedOnAdd().IsRequired();
            entity.Property(d => d.Nome);
            entity.Property(d => d.Descricao);
        });

        // Configurações para a classe Empresa
        modelBuilder.Entity<Empresa>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Id).ValueGeneratedOnAdd().IsRequired();
            entity.Property(e => e.Nome);
            entity.Property(e => e.Endereco);
            entity.Property(e => e.Telefone);
        });

        // Configurações para a classe Funcionario
        modelBuilder.Entity<Funcionario>(entity =>
        {
            entity.HasKey(f => f.Id);
            entity.Property(f => f.Id).ValueGeneratedOnAdd().IsRequired();
            entity.Property(f => f.Nome);
            entity.Property(f => f.Sobrenome);
            entity.Property(f => f.Endereco);
            entity.Property(f => f.Telefone);

            entity.HasMany(f => f.Tarefas)
                .WithOne(t => t.Funcionario)                //CORRIGIR ISTO!!!
                .HasForeignKey(t => t.Funcionario);
        });

        // Configurações para a classe Projeto
        modelBuilder.Entity<Projeto>(entity =>
        {
            entity.HasKey(p => p.Id);
            entity.Property(p => p.Id).ValueGeneratedOnAdd().IsRequired();
            entity.Property(p => p.Nome);
            entity.Property(p => p.Descricao);
            entity.Property(p => p.DataInicio);
            entity.Property(p => p.DataTermino);
        });

        // Configurações para a classe Tarefa
        modelBuilder.Entity<Tarefa>(entity =>
        {
            entity.HasKey(t => t.Id);
            entity.Property(t => t.Id).ValueGeneratedOnAdd().IsRequired();
            entity.Property(t => t.Descricao);
            entity.Property(t => t.DataInicio);
            entity.Property(t => t.DataTermino);
            entity.Property(t => t.Status);

            entity.HasOne(t => t.Cliente)
                .WithMany()
                .HasForeignKey(t => t.Cliente)
                .IsRequired();

            entity.HasOne(t => t.Departamento)
                .WithMany()
                .HasForeignKey(t => t.Departamento)
                .IsRequired();

            entity.HasOne(t => t.Projeto)
                .WithMany()
                .HasForeignKey(t => t.Projeto)
                .IsRequired();
        });
    }*/


}