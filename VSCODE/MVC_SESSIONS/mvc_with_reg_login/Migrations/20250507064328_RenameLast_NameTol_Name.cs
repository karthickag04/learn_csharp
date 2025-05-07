using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace mvc_with_reg_login.Migrations
{
    /// <inheritdoc />
    public partial class RenameLast_NameTol_Name : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Last_Name",
                table: "tbl_Users",
                newName: "l_Name");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "l_Name",
                table: "tbl_Users",
                newName: "Last_Name");
        }
    }
}
