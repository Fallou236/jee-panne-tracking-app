<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Se connecter</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="keyword" content="Form Login">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
  <link href="css/styl.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
  <div class="card card0 border-0">
    <div class="row d-flex">
      <div class="col-lg-6">
        <div class="card1 pb-5">
          <div class="row">
            <img src="images/images.png" class="logo" alt="Logo">
          </div>
          <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
            <img src="https://www.nglesson.com/assets/imgs/menu/services-en-ligne.jpg" class="image" alt="Services en ligne">
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="card2 card border-0 px-4 py-5">
          <div class="row mb-4 px-3">
            <h6 class="mb-0 mr-4 mt-2">Suivez-nous via</h6>
            <div class="facebook text-center mr-3">
              <a href="https://www.facebook.com/p/Universit%C3%A9-Assane-Seck-de-Ziguinchor-100082501965483/" target="_blank">
                <div class="fa fa-facebook"></div>
              </a>
            </div>
            <div class="twitter text-center mr-3">
              <a href="https://twitter.com/UAS_Ziguinchor?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor" target="_blank">
                <div class="fa fa-twitter"></div>
              </a>
            </div>
            <div class="linkedin text-center mr-3">
              <a href="https://sn.linkedin.com/company/universit%C3%A9-assane-seck-de-ziguinchor" target="_blank">
                <div class="fa fa-linkedin"></div>
              </a>
            </div>
          </div>
          <div class="row px-3 mb-4">
            <div class="line"></div>
            <small class="or text-center"></small>
            <div class="line"></div>
          </div>
          <form action="login" method="post">
            <div class="row px-3">
              <label class="mb-1" for="email">
                <h6 class="mb-0 text-sm">Adresse Email</h6>
              </label>
              <input class="mb-4" type="text" id="email" name="email" placeholder="Entrer votre Email" required>
            </div>
            <div class="row px-3">
              <label class="mb-1" for="password">
                <h6 class="mb-0 text-sm">Mot de passe</h6>
              </label>
              <input type="password" name="password" id="password" placeholder="Entrer votre Mot de passe" required>
            </div>
            <div class="row mb-3 px-3">
              <button type="submit" class="btn btn-blue text-center">Se connecter</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="bg-blue py-4">
      <div class="row px-3">
        <small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2024. All rights reserved.</small>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
