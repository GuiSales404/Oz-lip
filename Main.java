import java.util.concurrent.PriorityBlockingQueue;

class ObjetoAtivo {
  class Task implements Comparable < Task > {
    int prioridade; //Aqui,implementei para que com um menor numero tivesse uma maior prioridade, porque vem antes.
    String nome; 
    Task(String nome, int prioridade) {
      this.prioridade = prioridade;
      this.nome = nome;
    }
    public int compareTo(Task diferente) {
      return Integer.compare(this.prioridade, diferente.prioridade);
    }
  }
  private PriorityBlockingQueue < Task > dispatchQueue = new PriorityBlockingQueue<>();
  public ObjetoAtivo() {
    // Com o Scheduler de prioridades
    new Thread (() -> {
      while (true) {
        try {
          Task task = dispatchQueue.take();
          System.out.println("Executando a task referente a " + task.nome);
        } catch (InterruptedException e) {
          break;
        }
      }
    })
    .start();
  }
  public void doTask(String nome, int prioridade) {
    dispatchQueue.put(new Task(nome, prioridade));
  }

  public static void main(String args[]) {
    //Para testar a funcionalidade do Objeto Ativo Implementado
    ObjetoAtivo obj = new ObjetoAtivo();

    //Realizando a chamada em Threads diferentes
    Thread t1 = new Thread(() -> {
      obj.doTask("Thread 1 ", 4);
    });
    Thread t2 = new Thread(() -> {
      obj.doTask("Thread 2 ", 7);
    });
    Thread t3 = new Thread(() -> {
      obj.doTask("Thread 3 ", 9);
    });

    //Inicializando Threads 
    t1.start();
    t2.start();
    t3.start();
  }
}

