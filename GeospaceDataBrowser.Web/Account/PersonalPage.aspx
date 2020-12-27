﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonalPage.aspx.cs" Inherits="GeospaceDataBrowser.Web.Account.PersonalPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;<asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            Your username:
            <asp:LoginName ID="LoginName1" runat="server" />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/ChangePassword.aspx">Change your password</asp:HyperLink>
            &nbsp;<br />
            <br />
        </AnonymousTemplate>
    <LoggedInTemplate>
        Your username:
        <asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/ChangePassword.aspx">Change your password</asp:HyperLink>
        &nbsp;<br />
    </LoggedInTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator">
                <ContentTemplate>
                    Your username:
                    <asp:LoginName ID="LoginName1" runat="server" />
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/ChangePassword.aspx">Change your password</asp:HyperLink>
                    &nbsp;
                    <h2> User Management </h2>
                    <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="False" >
                    <Columns>
                        <%--<asp:CommandField ShowDeleteButton="True" />--%>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" />
                        <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                    </Columns>
                </asp:GridView>

                    <h2> User Role Management </h2>

                    <p align="center" style="color:#ff0000"> 
                     <asp:Label ID="ActionStatus" runat="server" CssClass="Important"></asp:Label> 
                    </p>

                    <h3>Manage Roles By User</h3> 

                <p> 
                     <b>Select a User:</b> 
                     <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" 
                          DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="UserList_SelectedIndexChanged"> 
                     </asp:DropDownList> 
                </p> 
                <p> 
                     <asp:Repeater ID="UsersRoleList" runat="server"> 
                          <ItemTemplate> 
                               <asp:CheckBox runat="server" ID="RoleCheckBox" 
                                   AutoPostBack="true" 
                                   Text='<%# Container.DataItem %>'
                                   OnCheckedChanged="RoleCheckBox_CheckChanged"/> 
                               <br /> 
                          </ItemTemplate> 
                     </asp:Repeater> 
                </p>

                <h3>Manage Users By Role</h3> 
                <p> 
                     <b>Select a Role:</b> 

                     <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RoleList_SelectedIndexChanged1"></asp:DropDownList> 
                </p> 
                <p>      <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="False" OnRowDeleting="RolesUserList_RowDeleting"

                          EmptyDataText="No users belong to this role."> 
                          <Columns> 
                               <asp:TemplateField HeaderText="Users"> 
                                    <ItemTemplate> 
                                         <asp:Label runat="server" id="UserNameLabel" 
                                              Text='<%# Container.DataItem %>'></asp:Label> 

                                    </ItemTemplate> 
                               </asp:TemplateField> 
                               <asp:CommandField DeleteText="Remove" ShowDeleteButton="True"/>
                          </Columns> 
                     </asp:GridView> </p>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
</asp:LoginView>
    <br />
</asp:Content>
