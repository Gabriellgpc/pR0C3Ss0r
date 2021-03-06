-- Descricao em VHL de um comparador de magnitude de 4 bits
--
-- autoria : Luis G P Condados
-- Testado e Aprovado

library ieee;
use ieee.std_logic_1164.all;


entity comparador_4bits is port
(
	a,b   : in std_logic_vector(3 downto 0);
	in_gt : in std_logic;
	in_eq : in std_logic;
	in_it : in std_logic;
	
	out_gt : out std_logic;
	out_eq : out std_logic;
	out_it : out std_logic
);
end comparador_4bits;

architecture hardware of comparador_4bits is

component comparador_full port 
(
	a,b   : in std_logic;
	in_gt : in std_logic;
	in_eq : in std_logic;
	in_it : in std_logic;
	
	out_gt : out std_logic;
	out_eq : out std_logic;
	out_it : out std_logic
);
end component;

signal in_gt_1 : std_logic;
signal in_eq_1 : std_logic;
signal in_it_1 : std_logic;

signal in_gt_2 : std_logic;
signal in_eq_2 : std_logic;
signal in_it_2 : std_logic;

signal in_gt_3 : std_logic;
signal in_eq_3 : std_logic;
signal in_it_3 : std_logic;


begin
	
	comp_0 : comparador_full port map(A => A(3), B => B(3),in_gt => in_gt ,in_eq => in_eq,in_it => in_it ,out_gt => in_gt_1, out_eq => in_eq_1, out_it => in_it_1);
	comp_1 : comparador_full port map(A => A(2), B => B(2),in_gt => in_gt_1 ,in_eq => in_eq_1,in_it => in_it_1 ,out_gt => in_gt_2, out_eq => in_eq_2, out_it => in_it_2);
	comp_2 : comparador_full port map(A => A(1), B => B(1),in_gt => in_gt_2 ,in_eq => in_eq_2,in_it => in_it_2 ,out_gt => in_gt_3, out_eq => in_eq_3, out_it => in_it_3);
	comp_3 : comparador_full port map(A => A(0), B => B(0),in_gt => in_gt_3 ,in_eq => in_eq_3,in_it => in_it_3 ,out_gt => out_gt, out_eq => out_eq, out_it => out_it);

end hardware;