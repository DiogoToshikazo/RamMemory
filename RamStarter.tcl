#Finaliza simulação
quit -sim

#Cria a biblioteca padrão
vlib work;

#Compila os arquivos
vcom *.vhd

#Inicio simulador projeto teste
vsim work.RamSimulator

#Configurar formas de onda
do wave.do

#Inicio teste
run 20 ms
