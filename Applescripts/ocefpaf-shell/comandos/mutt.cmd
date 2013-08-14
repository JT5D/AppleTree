mutt roadrunner@acme.com -s "Novo dispositivo infalível para caçar papa-lpéguas" -a dispositivo.pdf < mensagem.txt

  while read email
  do
    mutt $email -s "Novo dispositivo infalível para caçar papa-lpéguas" -a dispositivo.pdf < mensagem.txt
  done < listadeemails.txt
