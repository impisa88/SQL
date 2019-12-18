// Uso de fork

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>

int main()
{
   pid_t childpid;
   pid_t ppid;

   ppid =  getpid();
   
   int a = 2;
   int b = 3;

   printf("\tPai com PID %d\n", ppid); // getpid() retorna o pid do processo
   printf("\t a =%d e b=%d\n",a,b);
   
   childpid = fork();

    if (childpid == 0) 	//fork() cria um processo filho. Retorno (childpid) s? ? zero dentro do processo filho,
						// dentro do pai o retorno ? o pid do filho
						// ent?o esse if separa os c?digos que devem ser executados pelo filho e pelo pai
						// fork() retorna um valor negativo em caso de erro.
    {
 	    printf("\tFilho executando com PID %d\n", getpid());
 	    a = 4;
        b = 5;
 	    printf("\t a =%d e b=%d\n",a,b);
 	    
 	    if (childpid == 0) 	//fork() cria um processo neto
        {
     	    printf("\tNeto executando com PID %d\n", getpid());
     	    a = 6;
            b = 7;
     	    printf("\t a =%d e b=%d\n",a,b);
    
    	}
    	else if (childpid > 0)
    	{
     	    printf("\tPai com PID2 %d\n", ppid);
     	    printf("\t a =%d e b=%d\n",a,b);
    		wait(0); // Aguarda filho encerrar a execucao e n?o armazena raz?o da morte do filho
    	}
	}
	else if (childpid > 0)
	{
 	    printf("\tPai com PID2 %d\n", ppid);
 	    printf("\t a =%d e b=%d\n",a,b);
		wait(0); // Aguarda filho encerrar a execucao e n?o armazena raz?o da morte do filho
	}
}