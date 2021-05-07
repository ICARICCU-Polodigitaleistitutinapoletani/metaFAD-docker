Piattaforma metaFAD su infrastruttura Docker, parte del progetto metaFAD.

## Installazione
Clonare il repository

$ ```git clone https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-docker``` 


### Requisiti di sistema
- docker > 19.08
- docker-compose > 1.26.4
- git
- curl
- Sistema operativo macOS o Linux


### Prima installazione
Posizionarsi nella cartella "metaFAD-docker" ed eseguire il comando:

$ ```./metafad install```


### Avvio infrastruttura
Posizionarsi nella cartella "metaFAD-docker" ed eseguire il comando:

$ ```./metafad start```


Al termine dell'avvio le applicazioni risponderanno agli indirizzi:

- http://metafad.localhost
- http://metafad-portale.localhost


### Stop infrastruttura
Posizionarsi nella cartella "metaFAD-docker" ed eseguire il comando:

$ ```./metafad stop```

### Comandi
- ```./metafad``` (il comando lanciato senza parametri visualizza l'utilizzo)
- ```./metafad dump <nome_database>``` Crea un dump del db (il comando lanciato senza parametri mostra l'utilizzo)
- ```./metafad restoredb <nome_database> <file.sql>``` Esegue il restore di un file.sql posizionato precedentemente in containerdata/mysql/mysql_dump (il comando lanciato senza parametri mostra l'utilizzo)

### Esecuzione composer
Per ragioni di compatibilità è necessario lanciare il composer internamente al container, esiste una funzione apposita (```run```)

$ ```./metafad run``` (container) (comando)

es. ```./metafad run metafad composer install``` (il comando lanciato senza parametri mostra l'utilizzo)

### Visualizzazione logs apache
Il comando a vuoto mostra le opzioni disponibili

$ ```./metafad wwwlogs <webserver> <type_log>```

es. ```./metafad wwwlogs metafad error```

### Utility collegate
- PhpMyAdmin: http://ip_server:81 disattivato di default, per attivarlo decommentare le righe relative al servizio ```phpmyadmin``` nel file ```dockerdata\docker-compose.yml```
- Solr: http://127.0.0.1:8983/solr dashboard attivata esclusivamente nell'interfaccia di rete ```lo```, raggiungibile quindi o con indirizzo ```127.0.0.1``` o ```localhost```

### Cartelle condivise con la macchina host:
- ```containerdata/cantaloupe```: cartelle di storage delle immagini elaborate da Cantaloupe
- ```containerdata/dam```: cartelle di storage delle risorse del DAM
- ```containerdata/metafad/export```: cartella di esportazione dei dati
- ```containerdata/metafad/import```: cartella dove posizionare i file da importare con caricamento dati dal server
- ```containerdata/metafad/mag```: cartella dove posizionare i mag da importare con caricamento dati dal server
- ```containerdata/metafad/mag_export```: cartella di esportazione dei mag
- ```containerdata/metafad/unimarc```: cartella per lo scarico unimarc
- ```containerdata/mysql/data```: cartella contenente i DB mysql
- ```containerdata/mysql/mysql_dump```: cartella contenente i dump mySql per l'installazione
- ```containerdata/portale```: cartella contenente i file dell'archivio media del portale
- ```containerdata/solr```: cartella contenente i dati di SOLR

### Codice sorgente
Il codice sorgente si trova nella cartella ```app```

### Note installazione Cantaloupe
L'installazione di Cantaloupe è bastata su https://github.com/lyrasis/docker-cantaloupe

# Componenti della piattaform metaFAD
- Piattaforma metaFAD su infrastruttura Docker [metaFAD-docker](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-docker)
- Applicativo di catalogazione [metaFAD](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD)
- Portale di consultazione [Portale](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-portale)
- Servizi REST per il DAM [DAM](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-dam)
- Applicativo di Front End del DAM [DAM Front End](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-dam-fe)
- Servizi Java [iservices](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-iservices)
- Visore dei media digitali nel portale [Viewer](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-portale-viewer)
- Editor metadati strutturati [Editor Strumag](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-strumag)
- Portal Entity Builder [PEB](https://github.com/ICARICCU-Polodigitaleistitutinapoletani/metaFAD-peb)

# Licenza
"metaFAD docker" è rilasciato con licenza [GNU AFFERO GENERAL PUBLIC LICENSE v3](LICENSE)
