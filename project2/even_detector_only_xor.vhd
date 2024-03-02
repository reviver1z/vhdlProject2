library ieee;
use ieee.std_logic_1164.all;

entity even_detector_only_xor is
port(
even:out std_logic);
end even_detector_only_xor;

architecture sim of even_detector_only_xor is
signal xor_expr:std_logic_vector(2 downto 0);
begin
process(xor_expr)
begin
even<=xor_expr(2) xor xor_expr(1) xor xor_expr(0) after 20 ns;
end process;
end sim;
