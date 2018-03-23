<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html><html class=''>
<head>
<script src='/duna/resources/js/loginpage_console_runner.js'>
</script>
<script src='/duna/resources/js/loginpage_event_runner.js.js'></script>
<script src='/duna/resources/loginpage_css_live_reload_init.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/fbrz/pen/obKle?limit=all&page=71&q=form" />


<style class="cp-pen-styles">@import url(https://fonts.googleapis.com/css?family=Raleway:400,700);
html, body {
  height: 100%;
  margin: 0;
}

body {
  font-family: 'Raleway', sans-serif;
  background: #E9F8DF;
  -webkit-font-smoothing: antialiased;
}

:focus {
  outline: 0;
}

#wrapper {
  -webkit-perspective: 500px;
          perspective: 500px;
  position: absolute;
  top: 50%;
  left: 50%;
  text-align: center;
  -webkit-transform: translate3d(-50%, -50%, 0);
          transform: translate3d(-50%, -50%, 0);
}

h1 {
  color: #416171;
  font-size: 43px;
  margin: 0;
}

h2 {
  color: #349E97;
  margin: 0;
}

form {
  margin: 35px 0;
}

#inputs {
  height: 127px;
  -webkit-transition: height .5s ease-in-out;
  transition: height .5s ease-in-out;
}
#inputs div {
  height: 41px;
  -webkit-transform-origin: 0 0;
          transform-origin: 0 0;
  -webkit-transition: -webkit-transform .5s ease-in-out;
  transition: -webkit-transform .5s ease-in-out;
  transition: transform .5s ease-in-out;
  transition: transform .5s ease-in-out, -webkit-transform .5s ease-in-out;
}
#inputs > div > div > div {
  -webkit-transform: rotateX(0deg);
          transform: rotateX(0deg);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
}
#inputs > div > div > div input:nth-child(2),
#inputs > div > div > div > div input:nth-child(2) {
  -webkit-transform: translateZ(-1px) rotateX(180deg);
          transform: translateZ(-1px) rotateX(180deg);
}
#inputs > div > div > div > div {
  -webkit-transform: translateY(-41px) rotateX(0deg);
          transform: translateY(-41px) rotateX(0deg);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
}

input {
  background: #FFFEFC;
  border: 0;
  box-sizing: border-box;
  display: block;
  font-family: Raleway, sans-serif;
  font-weight: 600;
  font-size: 12px;
  margin: 0 auto;
  padding: 13px;
  text-transform: uppercase;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
  width: 300px;
  -webkit-transform-origin: 0 0;
          transform-origin: 0 0;
  -webkit-font-smoothing: antialiased;
}
input:hover {
  background: #f3f3f3;
}
input:focus {
  background: #EAEAEA;
}
input[type=submit] {
  background: #43434C;
  color: #FFFEFC;
  cursor: pointer;
}
input[type=radio] {
  display: none;
}

input:checked[value=reset] ~ #inputs {
  height: 84px;
}
input:checked[value=reset] ~ #labels {
  margin-top: -10px;
}
input:checked[value=reset] ~ #inputs div > div > div {
  -webkit-transform: rotateX(180deg);
          transform: rotateX(180deg);
}
input:checked[value=reset] ~ #inputs div > div > div > div {
  -webkit-transform: translateY(-41px) rotateX(180deg);
          transform: translateY(-41px) rotateX(180deg);
}
input:checked[value=reset] ~ #labels label[for=reset],
input:checked[value=reset] ~ #labels label[for=register],
input:checked[value=reset] ~ #labels label[for=login]:first-child {
  -webkit-transition: opacity .5s;
  transition: opacity .5s;
  opacity: 0;
}
input:checked[value=register] ~ #inputs {
  height: 170px;
}
input:checked[value=register] ~ #labels {
  margin-top: 30px;
}
input:checked[value=register] ~ #labels label[for=reset],
input:checked[value=register] ~ #labels label[for=register],
input:checked[value=register] ~ #labels label[for=login]:nth-child(3) {
  -webkit-transition: opacity .5s;
  transition: opacity .5s;
  opacity: 0;
}
input:checked[value=login] ~ #labels {
  margin-top: 11px;
}
input:checked[value=login] ~ #inputs div > div > div > div {
  -webkit-transform: translateY(-41px) rotateX(180deg);
          transform: translateY(-41px) rotateX(180deg);
}
input:checked[value=login] ~ #labels label[for=login] {
  -webkit-transition: opacity .5s;
  transition: opacity .5s;
  opacity: 0;
}

#labels {
  -webkit-transition: margin .5s ease-in-out;
  transition: margin .5s ease-in-out;
}

label {
  display: block;
  font-size: 14px;
  color: #43434C;
  margin-bottom: 5px;
  font-weight: 600;
  height: 16px;
  -webkit-transition: opacity 1s .3s;
  transition: opacity 1s .3s;
  overflow: hidden;
}
label span {
  cursor: pointer;
  color: #349E97;
}

#hint {
  position: absolute;
  bottom: 20px;
  opacity: .2;
  left: 50%;
  margin: 0 -62px;
  font-weight: 600;
}

#logo{
	width: 200px;
	height: 100px;
	
}
</style></head>
<body>
<div id="wrapper" >
  <img id="logo" src="/duna/resources/image/Duna_world_logo.png"><br>
  <h2>A cool headline.</h2>
  <form>
    <input type="radio" id="login" name="action" value="login" checked>
    <input type="radio" id="register" name="action" value="register">
    <input type="radio" id="reset" name="action" value="reset">
    <div id="inputs">
      <div>
        <input type="text" placeholder="id" >
        <div>
          <input type="password" placeholder="password">
          <div>
            <input type="password" placeholder="repeat password">
            <input type="submit" value="find password">
            <div>
              <input type="submit" value="register">
              <input type="submit" value="login">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="labels">
      <label for="login">Already registered? <span>Login</span></label>
      <label for="reset">Password lost? <span>Find</span></label>
      <label for="login"><span>Back</span></label>
      <label for="register">Not registered? <span>Create an account</span></label>
    </div>
  </form>
</div>
  
<div id="hint">click on the links</div>

</body></html>