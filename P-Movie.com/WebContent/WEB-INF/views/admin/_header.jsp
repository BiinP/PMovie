<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <c:url var="adminPage" value="/admin"/>
    <c:url var="home" value="/"/>
<header class="header">
    <nav class="navbar navbar-expand-lg">

      <div class="container-fluid d-flex align-items-center justify-content-between">
        <div class="navbar-header">
          <!-- Navbar Header--><a href="index.html" class="navbar-brand">
            <div class="brand-text brand-big visible text-uppercase"><strong
                class="text-primary">P</strong><strong>Movie</strong></div>
            <div class="brand-text brand-sm"><strong class="text-primary">P</strong><strong>M</strong></div>
          </a>
          <!-- Sidebar Toggle Btn-->
          <button class="sidebar-toggle"><i class="fa fa-long-arrow-left"></i></button>
        </div>
        <div class="right-menu list-inline no-margin-bottom">
          <!-- Languages dropdown    -->
          <div class="list-inline-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
              class="nav-link language dropdown-toggle"><img src="${adminPage }/img/flags/16/GB.png" alt="English"><span
                class="d-none d-sm-inline-block">English</span></a>
            <div aria-labelledby="languages" class="dropdown-menu"><a rel="nofollow" href="#" class="dropdown-item">
                <img src="${adminPage }/img/flags/16/DE.png" alt="English" class="mr-2"><span>German</span></a><a rel="nofollow"
                href="#" class="dropdown-item"> <img src="${adminPage }/img/flags/16/FR.png" alt="English" class="mr-2"><span>French
                </span></a></div>
          </div>
          <!-- Log out               -->
          <div class="list-inline-item logout"> <a id="logout" href="/P-Movie.com/sign-out" class="nav-link">Logout <i
                class="icon-logout"></i></a></div>
        </div>
      </div>
    </nav>
  </header>