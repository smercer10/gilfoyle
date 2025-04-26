const board = @import("board.zig");
const std = @import("std");

pub fn main() !void {
    std.debug.print("board.State size: {} bytes\n", .{@sizeOf(board.State)});
}
