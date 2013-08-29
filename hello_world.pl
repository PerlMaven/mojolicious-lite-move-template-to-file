use Mojolicious::Lite;

get '/' => sub {
    my $self = shift;
    $self->render('index');
};

get '/echo' => sub {
    my $self = shift;
    $self->render('echo', msg => undef);
};

post '/echo' => sub {
    my $self = shift;
    $self->render( 'echo', msg => $self->param('q') );
};

app->secret('My extra secret passphrase.');

app->start;

__DATA__

@@ layouts/wrapper.html.ep
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <link href="/style.css" rel="stylesheet">
</head>
<body>
<div id="menu">
<ul>
  <li><a href="/">home</a></li>
  <li><a href="/echo">echo</a></li>
</ul>
</div>

<%= content %>

</body>
</html>
 
@@ echo.html.ep
% layout 'wrapper';

What are you looking for?
<form method="POST"><input name="q"><input type="submit" value="Echo"></form>

% if (defined $msg) {
   You typed: <%= $msg %>
% }

