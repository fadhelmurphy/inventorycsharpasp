<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relasi.aspx.cs" Inherits="SistemBarang.Relasi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
    <link href="assets/style.css" rel="stylesheet" />
    <script src="assets/slim.min.js"></script>
    <script src="assets/popper.min.js"></script>
    <script src="assets/bootstrap.min.js"></script>
    <script src="assets/custom.js"></script>
</head>
<body>
<header>
      <!-- Fixed navbar -->
      <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <div class="lh-100">
            <a class="mb-0 text-white lh-100 navbar-brand" href="#">Warehouse App</a>
          <small class="text-white">52417025</small>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><script>document.write(getCookie('user'))</script></a>
                 <div class="dropdown-menu dropdown-custom" aria-labelledby="navbarDropdown">
                     <a class="dropdown-item" onclick="delCookie('user')" href="#">Logout</a>
                </div>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <form id="form1" runat="server">
         <div class="container-fluid px-0">
        <div class="row" id="body-row">
    <div class="container-fluid px-0">
        <div class="row" id="body-row">
        <div id="sidebar-container" class="sidebar-expanded d-none d-md-block bg-light">
        <ul class="list-group">
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary" href="Inventori.aspx">
                    Inventory
            </a>
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary" href="Restok.aspx">
                Restok
            </a>
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary" href="Penjualan.aspx">
                Penjualan
            </a>
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary active" href="Relasi.aspx">
                Suplier/Client
            </a>
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed bg-light">
                <small>FADHEL IJLAL FALAH 2019</small>
            </li>          
           
        </ul>
    </div> <!-- End Sidebar -->
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h3 class="pr-4">Penyuplai</h3>
                    <button type="button" class="btn btn-primary mr-auto" 
                                            onclick="addClear()"
                                            data-toggle="modal" data-target="#AddForm"><i class="fa fa-plus"></i> Tambah</button>
          </div>
                    <div class="table-responsive">
                        <asp:GridView ID="TabelPenyuplai" runat="server" AutoGenerateColumns="false"
                            ClientIDMode="Inherit"  CssClass="table table-bordered table-hover" 
                            HeaderStyle-CssClass="thead table-primary" CellSpacing="-1" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText = "No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="nama" HeaderText="Nama"/>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                         <button type="button" class="btn btn-sm btn-info" 
                                            onclick="editGet(this,'<%# DataBinder.Eval(Container.DataItem,"id") %>')"
                                            data-toggle="modal" data-target="#AddForm">
                                            <i class="fa fa-pen"></i> Edit
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger" 
                                            onclick="delGet(this,'<%# DataBinder.Eval(Container.DataItem,"id") %>')"
                                            data-toggle="modal" data-target="#AddForm">
                                            <i class="fa fa-trash"></i> Hapus
                                        </button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <hr />
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h3 class="pr-4">Klien</h3>
                            <button type="button" class="btn btn-primary mr-auto"
                                            onclick="addClear2()"
                                            data-toggle="modal" data-target="#AddForm"><i class="fa fa-plus"></i> Tambah</button>
                  </div>
                    <div class="table-responsive">
                        <asp:GridView ID="TabelKlien" runat="server" AutoGenerateColumns="false"
                            ClientIDMode="Inherit"  CssClass="table table-bordered table-hover" 
                            HeaderStyle-CssClass="thead table-primary" CellSpacing="-1" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText = "No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="namaDepan" HeaderText="Nama Depan"/>
                                <asp:BoundField DataField="namaBelakang" HeaderText="Nama Belakang"/>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                         <button type="button" class="btn btn-sm btn-info" 
                                            onclick="editGet2(this,'<%# DataBinder.Eval(Container.DataItem,"id") %>')"
                                            data-toggle="modal" data-target="#AddForm">
                                            <i class="fa fa-pen"></i> Edit
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger" 
                                            onclick="delGet2(this,'<%# DataBinder.Eval(Container.DataItem,"id") %>')"
                                            data-toggle="modal" data-target="#AddForm">
                                            <i class="fa fa-trash"></i> Hapus
                                        </button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                                <!-- Modal Bootstraps goes here!-->

                <div class="modal fade" id="AddForm" tabindex="-1" role="dialog" aria-labelledby="AddFormLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 id="judulForm"></h5>
                            </div>
                            <div class="modal-body">
                                    <label for="idnama">ID</label>
                                    <asp:TextBox ID="idnama" runat="server" CssClass="form-control"></asp:TextBox>
                                    <label for="Nama">Nama</label>
                                    <asp:TextBox ID="Nama" runat="server" CssClass="form-control"></asp:TextBox>
                                
                                <div id="IdHide">
                                <label for="Belakang">Nama Belakang</label>
                                <asp:TextBox ID="Belakang" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-secondary" data-dismiss="modal" Text="Tutup"/>
                                <asp:Button ID="AddButton" runat="server" CssClass="btn btn-primary" Text="Tambah" OnClick="AddButton_Click"/>
                                <asp:Button ID="AddButton2" runat="server" CssClass="btn btn-primary" Text="Tambah" OnClick="AddButton2_Click"/>
                                <asp:Button ID="EditButton" runat="server" CssClass="btn btn-success" Text="Simpan" OnClick="EditButton_Click"/>
                                <asp:Button ID="EditButton2" runat="server" CssClass="btn btn-success" Text="Simpan" OnClick="EditButton2_Click"/>
                                <asp:Button ID="HapusButton" runat="server" CssClass="btn btn-danger" Text="Hapus" OnClick ="HapusButton_Click"/>
                                <asp:Button ID="HapusButton2" runat="server" CssClass="btn btn-danger" Text="Hapus" OnClick ="HapusButton2_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            </div>
        </div>
    </form>
        <script>
        function editGet(obj, idNama) {
            getRow = obj.parentElement.parentElement;
            document.getElementById("judulForm").innerText = "Ubah Rekaman";
            document.getElementById("IdHide").setAttribute("hidden", "hidden");
            document.getElementById("AddButton").setAttribute("hidden", "hidden");
            document.getElementById("AddButton2").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton2").setAttribute("hidden", "hidden");
            document.getElementById("Belakang").setAttribute("hidden", "hidden");
            document.getElementById("EditButton2").setAttribute("hidden", "hidden");
            document.getElementById("EditButton").removeAttribute("hidden");
            document.getElementById("idnama").setAttribute("readonly", "readonly");
            document.getElementById("idnama").value = idNama;
            document.getElementById("Nama").value = getRow.childNodes.item(2).innerText;
        }
        function addClear() {
            document.getElementById("judulForm").innerText = "Tambah Rekaman";
            document.getElementById("IdHide").setAttribute("hidden", "hidden");
            document.getElementById("AddButton").removeAttribute("hidden");
            document.getElementById("AddButton2").setAttribute("hidden", "hidden");
            document.getElementById("Belakang").setAttribute("hidden", "hidden");
            document.getElementById("EditButton").setAttribute("hidden", "hidden");
            document.getElementById("EditButton2").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton2").setAttribute("hidden", "hidden");
            document.getElementById("idnama").removeAttribute("readonly");
            document.getElementById("idnama").value = null;
            document.getElementById("Nama").value = null;
            document.getElementById("Belakang").value = null;
        }
        function delGet(obj, idNama) {
            document.getElementById("judulForm").innerText = "Hapus Rekaman";
            document.getElementById("IdHide").setAttribute("hidden", "hidden");
            document.getElementById("AddButton").setAttribute("hidden", "hidden");
            document.getElementById("AddButton2").setAttribute("hidden", "hidden");
            document.getElementById("EditButton").setAttribute("hidden", "hidden");
            document.getElementById("EditButton2").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton").removeAttribute("hidden");
            document.getElementById("HapusButton2").setAttribute("hidden", "hidden");
            document.getElementById("idnama").setAttribute("readonly", "readonly");
            document.getElementById("idnama").value = idNama;
            document.getElementById("Nama").value = obj.parentElement.parentElement.childNodes.item(2).innerText;
        }

        function delGet2(obj, idNama) {
            document.getElementById("judulForm").innerText = "Hapus Rekaman";
            document.getElementById("IdHide").setAttribute("hidden", "hidden");
            document.getElementById("AddButton").setAttribute("hidden", "hidden");
            document.getElementById("AddButton2").setAttribute("hidden", "hidden");
            document.getElementById("EditButton").setAttribute("hidden", "hidden");
            document.getElementById("EditButton2").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton2").removeAttribute("hidden");
            document.getElementById("idnama").setAttribute("readonly", "readonly");
            document.getElementById("idnama").value = idNama;
            document.getElementById("Nama").value = obj.parentElement.parentElement.childNodes.item(2).innerText;
        }

        function editGet2(obj, idNama) {
            getRow = obj.parentElement.parentElement;
            document.getElementById("judulForm").innerText = "Ubah Rekaman";
            document.getElementById("IdHide").setAttribute("hidden", "hidden");
            document.getElementById("AddButton").setAttribute("hidden", "hidden");
            document.getElementById("AddButton2").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton2").setAttribute("hidden", "hidden");
            document.getElementById("IdHide").removeAttribute("hidden");
            document.getElementById("Belakang").removeAttribute("hidden");
            document.getElementById("Belakang").value = getRow.childNodes.item(3).innerText;
            document.getElementById("EditButton").setAttribute("hidden", "hidden");
            document.getElementById("EditButton2").removeAttribute("hidden");
            document.getElementById("idnama").setAttribute("readonly", "readonly");
            document.getElementById("idnama").value = idNama;
            document.getElementById("Nama").value = getRow.childNodes.item(2).innerText;
        }
        function addClear2() {
            document.getElementById("judulForm").innerText = "Tambah Rekaman";
            document.getElementById("IdHide").removeAttribute("hidden");
            document.getElementById("AddButton2").removeAttribute("hidden");
            document.getElementById("AddButton").setAttribute("hidden", "hidden");
            document.getElementById("Belakang").removeAttribute("hidden");
            document.getElementById("EditButton").setAttribute("hidden", "hidden");
            document.getElementById("EditButton2").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton").setAttribute("hidden", "hidden");
            document.getElementById("HapusButton2").setAttribute("hidden", "hidden");
            document.getElementById("idnama").removeAttribute("readonly");
            document.getElementById("idnama").value = null;
            document.getElementById("Nama").value = null;
            document.getElementById("Belakang").value = null;
        }

    </script>
</body>
</html>
