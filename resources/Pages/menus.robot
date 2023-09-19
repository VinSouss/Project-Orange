*** Settings ***
Documentation    System Menus

*** Variables ***   
&{pg_menus}
...    menu_admin=a[href="/web/index.php/admin/viewAdminModule"]
...    menu_pim=a[href="/web/index.php/pim/viewPimModule"]
...    menu_dashboard=a[href="/web/index.php/dashboard/index"]