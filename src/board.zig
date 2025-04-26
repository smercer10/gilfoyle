pub const Bitboard = u64;

pub const State = struct {
    // [0] = white, [1] = black.
    pawns: [2]Bitboard,
    knights: [2]Bitboard,
    bishops: [2]Bitboard,
    rooks: [2]Bitboard,
    queens: [2]Bitboard,
    kings: [2]Bitboard,

    occupancy: [3]Bitboard, // [0] = white, [1] = black, [2] = all.

    zobrist_hash: u64,

    fullmove_number: u16,

    p: packed struct {
        halfmove_clock: u7,
        side_to_move: u1, // 0 = white, 1 = black.
        castling_rights: u4, // 0b0001 = white kingside, 0b0010 = white queenside, 0b0100 = black kingside, 0b1000 = black queenside.
        en_passant_file: u4, // 0-7 or 0xF if no en passant square.
    },

    pub fn has_en_passant(self: *State) bool {
        return self.en_passant_file < 8;
    }

    pub fn get_en_passant_square(self: *State) u4 {
        const rank = if (self.side_to_move == 0) 5 else 2;
        return (self.en_passant_file << 3) | rank;
    }
};
