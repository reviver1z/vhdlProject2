library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- for to_integer and to_unsigned functions

entity tb_even_detector_only_xor is
end tb_even_detector_only_xor;

architecture testbench of tb_even_detector_only_xor is
    signal even_out : std_logic;
    signal xor_expr_in : std_logic_vector(2 downto 0) := "000";
begin
    uut: entity work.even_detector_only_xor
        port map (
            even => even_out
        );

    stimulus_process: process
    begin
        -- Test with different input vectors
        xor_expr_in <= "000"; wait for 20 ns;
        xor_expr_in <= "001"; wait for 20 ns;
        xor_expr_in <= "010"; wait for 20 ns;
        xor_expr_in <= "011"; wait for 20 ns;
        xor_expr_in <= "100"; wait for 20 ns;
        xor_expr_in <= "101"; wait for 20 ns;
        xor_expr_in <= "110"; wait for 20 ns;
        xor_expr_in <= "111"; wait for 20 ns;

        wait;
    end process;

    check_process: process
    begin
        wait for 100 ns;  -- Wait for initial stabilization

        assert even_out = '1' report "Test failed for input '000'" severity error;
        assert even_out = '0' report "Test failed for input '001'" severity error;
        assert even_out = '0' report "Test failed for input '010'" severity error;
        assert even_out = '1' report "Test failed for input '011'" severity error;
        assert even_out = '0' report "Test failed for input '100'" severity error;
        assert even_out = '1' report "Test failed for input '101'" severity error;
        assert even_out = '1' report "Test failed for input '110'" severity error;
        assert even_out = '0' report "Test failed for input '111'" severity error;

        report "All tests passed successfully." severity note;
        wait;
    end process;

end testbench;
