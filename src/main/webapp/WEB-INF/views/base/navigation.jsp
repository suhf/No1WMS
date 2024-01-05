<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 네비게이션 쪽 -->
<div class="col-auto col-md-2 col-xl-2 px-sm-2 px-0 navi-bg">
    <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 min-vh-100">

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="#">
                    <div class="text-center">
                        <img  class="img-user" src="https://academy.ilwoo.org/data/file/reference/3531300541_J1gHPmC6_479f762b4825515abc781b3a616929d8949ea2c5.jpg" alt="유저 이미지">
                        <br>
                        <p class="user-name">김이박 사원</p>
                    </div>
                </a>
            </li>
            <hr class="my-3">
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/account/list">
                    <i data-feather="users"></i>계정
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/password_reset">
                    <i data-feather="key"></i>비밀번호 초기화
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2 active" aria-current="page" href="/authority/list">
                    <i data-feather="user"></i>권한
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/category/list">
                    <i data-feather="user"></i>제품 카테고리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/product/list">
                    <i data-feather="box"></i>제품
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/price/list">
                    <i data-feather="dollar-sign"></i>제품 가격
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/vender/list">
                    <i data-feather="compass"></i>거래처
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/warehouse/list">
                    <i data-feather="inbox"></i>창고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/stock/list">
                    <i data-feather="archive"></i>재고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/plan_in/list">
                    <i data-feather="user"></i>입고 예정
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/in/list">
                    <i data-feather="check"></i>입고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/out/list">
                    <i data-feather="truck"></i>출고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center gap-2" href="/board/list">
                    <i data-feather="list"></i>게시판
                </a>
            </li>
        </ul>

        <hr class="my-3">
        <!-- 메뉴 쪽 -->
        <ul class="nav flex-column">

        </ul>

    </div>
</div>