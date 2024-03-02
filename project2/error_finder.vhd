library ieee;
use ieee.std_logic_1164.all;

entity error_finder  is
end error_finder;

architecture testbench of error_finder is
    signal a : std_logic_vector(2 downto 0);  -- Σήμα εισόδου
    signal even_out : std_logic;               -- Σήμα εξόδου
    signal error_detected : std_logic;        -- Σήμα που υποδεικνύει εάν εντοπίζεται σφάλμα

    -- Εισαγωγή επιπλέον σημάτων ή μεταβλητών αν απαιτείται για συγκεκριμένες δοκιμές

begin
    uut: entity error_finder
        port map (
            a => a,
            even => even_out,
            error_detected => error_detected
        );

    stimulus_process: process
    begin
        a <= "000"; wait for 20 ns;  -- Δοκιμή με κανονική είσοδο
        a <= "001"; wait for 20 ns;  -- Δοκιμή με είσοδο που προκαλεί σφάλμα
        -- Προσθήκη περισσότερων περιπτώσεων δοκιμής αν χρειαστεί
        wait;
    end process;

    check_process: process
    begin
        wait for 100 ns;  -- Αναμονή για αρχική σταθεροποίηση
        assert error_detected = '1' report "Σφάλμα δεν εντοπίστηκε για την είσοδο '001'" severity error;
        report "Η προσομοίωση ολοκληρώθηκε επιτυχώς." severity note;
        wait;
    end process;

end testbench;
