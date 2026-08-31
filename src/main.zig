const std = @import("std");

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn main() !void {
    std.debug.print("Hello from Zig + Grok Build in GitHub Codespaces.\n", .{});
    std.debug.print("2 + 2 = {d}\n", .{add(2, 2)});
}

test "add" {
    try std.testing.expectEqual(@as(i32, 4), add(2, 2));
}
