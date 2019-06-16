<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Penjualan.aspx.cs" Inherits="SistemBarang.PenjualanBarang" %>

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
        <div id="sidebar-container" class="sidebar-expanded d-none d-md-block bg-light">
        <ul class="list-group">
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary" href="Inventori.aspx">
                    Inventory
            </a>
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary" href="Restok.aspx">
                Restok
            </a>
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary active" href="Penjualan.aspx">
                Penjualan
            </a>
            <a class="list-group-item list-group-item-action flex-column align-items-start text-secondary" href="Relasi.aspx">
                Kontak/Relasi
            </a>
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed bg-light">
                <small>FADHEL IJLAL FALAH 2019</small>
            </li>          
           
        </ul>
    </div> <!-- End Sidebar -->
             <main role="main" class="col-md-9 ml-sm-auto col-lg-10">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="pr-4">Penjualan Barang</h1>
                    <button type="button" class="btn btn-primary mr-auto" data-toggle="modal" data-target="#AddForm" onclick="addClear()">
                        <i class="fa fa-plus"></i> Tambah
                    </button>
          </div>
                    <div class="table-responsive">
                        <asp:GridView ID="TabelPenjualanbarang" runat="server" AutoGenerateColumns="false"
                            ClientIDMode="Inherit"  CssClass="table table-bordered table-hover" 
                            HeaderStyle-CssClass="thead table-primary" CellSpacing="-1" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText = "No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderText="ID Penjualan" />
                                <asp:BoundField DataField="tanggal" HeaderText="Tanggal"/>
                                <asp:BoundField DataField="nama" HeaderText="Nama Barang"/>
                                <asp:BoundField DataField="jenis" HeaderText="Jenis"/>
                                <asp:BoundField DataField="namaDepan" HeaderText="Nama Depan"/>
                                <asp:BoundField DataField="namaBelakang" HeaderText="Nama Belakang"/>
                                <asp:BoundField DataField="jumlah" HeaderText="Jumlah Dijual"/>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <button type="button" class="btn btn-sm btn-info" 
                                            onclick="editGet(this,'<%# DataBinder.Eval(Container.DataItem,"idBarang") %>','<%# DataBinder.Eval(Container.DataItem,"idKlien")%>')"
                                            data-toggle="modal" data-target="#AddForm">
                                            <i class="fa fa-pen"></i> Edit
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger"
                                            onclick="delGet(this)" data-toggle="modal" data-target="#DelForm">
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
                                <div id="IdHide">
                                    <label for="IdTransaksi">ID Transaksi</label>
                                    <asp:TextBox ID="IdTransaksi" runat="server" CssClass="form-control"></asp:TextBox>
                                    <br />
                                </div>
                                <label for="IdBarang">Nama Barang</label>
                                <asp:DropDownList ID="IdBarang" runat="server" CssClass="form-control"></asp:DropDownList>
                                <br />

                                <label for="IdKlien">Klien</label>
                                <asp:DropDownList ID="IdKlien" runat="server" CssClass="form-control"></asp:DropDownList>
                                <br />

                                <label for="Jumlah">Jumlah</label>
                                <asp:TextBox ID="Jumlah" runat="server" CssClass="form-control" TextMode="Number" ></asp:TextBox>
                                <br />
                            
                                <label for="Tanggal">Tanggal Penjualan</label>
                                <asp:TextBox ID="Tanggal" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                <br />
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-secondary" data-dismiss="modal" Text="Tutup"/>
                                <asp:Button ID="AddButton" runat="server" CssClass="btn btn-primary" Text="Tambah" OnClick="AddButton_Click"/>
                                <asp:Button ID="EditButton" runat="server" CssClass="btn btn-success" Text="Simpan" OnClick="EditButton_Click"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="DelForm" tabindex="-1" role="dialog" aria-labelledby="DelFormLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5>Barang ini akan dihapus dengan ketentuan sebagai berikut :</h5>
                            </div>
                            <div class="modal-body">
                                <label for="IdTransaksiDel">ID Transaksi</label>
                                <asp:TextBox ID="IdTransaksiDel" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="modal-footer">
                                <h5>Apakah anda yakin?</h5>
                            </div>
                           <div class="modal-footer">
                                <asp:Button ID="DelButton" runat="server" CssClass="btn btn-primary" Text="Ya" OnClick ="DelButton_Click"/>
                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-danger" data-dismiss="modal" Text="Tidak"/>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
            </div>
             </div>
    </form>
    <script>
        function editGet(obj, idBarang, idKlien) {
            getRow = obj.parentElement.parentElement;
            document.getElementById("judulForm").innerText = "Ubah Rekaman";
            document.getElementById("IdHide").removeAttribute("hidden");
            document.getElementById("AddButton").setAttribute("hidden", "hidden");
            document.getElementById("EditButton").removeAttribute("hidden");
            document.getElementById("IdTransaksi").setAttribute("readonly", "readonly");
            document.getElementById("IdTransaksi").value = getRow.childNodes.item(2).innerText;
            document.getElementById("IdBarang").value = idBarang;
            document.getElementById("IdKlien").value = idKlien;
            document.getElementById("Jumlah").value = getRow.childNodes.item(8).innerText;
            document.getElementById("Tanggal").value = getRow.childNodes.item(3).innerText;
        }
        function addClear() {
            document.getElementById("judulForm").innerText = "Tambah Rekaman";
            document.getElementById("IdHide").setAttribute("hidden", "hidden");
            document.getElementById("AddButton").removeAttribute("hidden");
            document.getElementById("EditButton").setAttribute("hidden", "hidden");
            document.getElementById("IdTransaksi").value = null;
            document.getElementById("IdBarang").selectedIndex = 0; 
            document.getElementById("IdKlien").selectedIndex = 0; 
            document.getElementById("Jumlah").value = null;
            document.getElementById("Tanggal").value = null;
        }
        function delGet(obj) {
            document.getElementById("IdTransaksiDel").setAttribute("readonly", "readonly");
            document.getElementById("IdTransaksiDel").value = obj.parentElement.parentElement.childNodes.item(2).innerText;;
        }

    </script>
</body>
</html>
