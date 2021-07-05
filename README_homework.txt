Pre-requisites:
	1. Prepare application server:
		1.1. Copy Oracle client zip file to application server:
			a) filename: /vagrant/downloads/LINUX.X64_193000_client.zip
			
	2. Prepare database
		2.1. Create DB user: ANSIBLE (Password: ansibletest)
		2.2. Grant DB system privilege to connect to database and DB object privilege: create table
	
	3. Prepare ANSIBLE server 
		3.1. Copy code to ANSIBLE server by following file schema:
		
		/etc/ansible
		├── ansible.cfg
		├── homework.yml
		├── hosts
		└── roles
			├── generate_ORCL_output
			│   ├── defaults
			│   │   └── main.yml
			│   ├── files
			│   │   ├── 001_create_table.sql
			│   │   ├── 002_generate_data.sql
			│   │   └── 003_create_output.sql
			│   ├── handlers
			│   │   └── main.yml
			│   ├── meta
			│   │   └── main.yml
			│   ├── README.md
			│   ├── tasks
			│   │   ├── delete_file.yml
			│   │   └── main.yml
			│   ├── templates
			│   ├── tests
			│   │   ├── inventory
			│   │   └── test.yml
			│   └── vars
			│       └── main.yml
			└── install_oracle_client
				├── defaults
				│   └── main.yml
				├── files
				│   └── tns_upd.sh
				├── handlers
				│   └── main.yml
				├── meta
				│   └── main.yml
				├── README.md
				├── tasks
				│   ├── configuration.yml
				│   └── main.yml
				├── templates
				│   └── oracleclient.soft.rsp.j2
				├── tests
				│   ├── inventory
				│   └── test.yml
				└── vars
					└── main.yml

		3.2. Edit entry IP addresses to your own system IPs

Code execution:
In order to install client and gather output (gathered_data.csv) run following commands from ANSIBLE server byroot:
	1. Install client & gather output
		cd /etc/ansible
		ansible-playbook homework.yml
	2. Install agent only:
		cd /etc/ansible
		ansible-playbook homework.yml --tags "install_oracle_client_tag"
	3. 	Gather output
		cd /etc/ansible
		ansible-playbook homework.yml --tags "generate_ORCL_output_tag"
		
Post steps:
	Format csv file by converting comma separated list into cells:
    1. Highlight the column that contains your list.
    2. Go to Data > Text to Columns.
    3. Choose Delimited. Click Next.
    4. Choose Comma. Click Next.
    5. Choose General or Text, whichever you prefer.
    6. Leave Destination as is, or choose another column. Click Finish.