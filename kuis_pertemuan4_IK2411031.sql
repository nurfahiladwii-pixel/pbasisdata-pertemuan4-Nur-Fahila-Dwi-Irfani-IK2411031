DROP TABLE IF EXISTS produk;

CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(120),
    stok INT
);

INSERT INTO produk (nama_produk, stok) VALUES
('Pensil', 8),
('Buku', 15),
('Penghapus', 2),
('Pulpen', 30),
('Spidol', 12);

DELIMITER //
DROP PROCEDURE IF EXISTS cek_status_stok //

CREATE PROCEDURE cek_status_stok(IN p_stok INT)
BEGIN
    DECLARE v_status VARCHAR(60);

    IF p_stok = 2 THEN
        SET v_status = 'Habis';
    ELSEIF p_stok BETWEEN 3 AND 7 THEN
        SET v_status = 'Hampir Habis';
    ELSEIF p_stok BETWEEN 8 AND 25 THEN
        SET v_status = 'Tersedia';
    ELSE
        SET v_status = 'Stok Aman';
    END IF;

    SELECT p_stok AS stok,
           v_status AS status;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS hitung_diskon //

CREATE PROCEDURE hitung_diskon(IN p_total DECIMAL(14,3))
BEGIN
    DECLARE v_persen INT;
    DECLARE v_diskon DECIMAL(14,3);
    DECLARE v_total_bayar DECIMAL(14,3);

    IF p_total >= 1500000 THEN
        SET v_persen = 20;
    ELSEIF p_total >= 700000 THEN
        SET v_persen = 12;
    ELSEIF p_total >= 300000 THEN
        SET v_persen = 7;
    ELSE
        SET v_persen = 1;
    END IF;

    SET v_diskon = p_total * v_persen / 100;
    SET v_total_bayar = p_total - v_diskon;

    SELECT p_total AS total_belanja,
           v_persen AS diskon_persen,
           v_diskon AS jumlah_diskon,
           v_total_bayar AS total_bayar;
END //
DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS cek_predikat_mahasiswa //

CREATE PROCEDURE cek_predikat_mahasiswa(IN p_nilai INT)
BEGIN
    DECLARE v_predikat VARCHAR(60);
    DECLARE v_status VARCHAR(60);

    IF p_nilai >= 95 THEN
        SET v_predikat = 'Sangat Memuaskan';
    ELSEIF p_nilai >= 85 THEN
        SET v_predikat = 'Memuaskan';
    ELSEIF p_nilai >= 75 THEN
        SET v_predikat = 'Baik';
    ELSEIF p_nilai >= 65 THEN
        SET v_predikat = 'Cukup';
    ELSE
        SET v_predikat = 'Kurang';
    END IF;

    IF p_nilai >= 75 THEN
        SET v_status = 'Lulus';
    ELSE
        SET v_status = 'Tidak Lulus';
    END IF;

    SELECT 
        p_nilai AS nilai,
        v_predikat AS predikat,
        v_status AS status;
END //

DELIMITER ;