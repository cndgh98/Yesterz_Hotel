from django import forms


class LoginForm(forms.Form):
    username = forms.CharField(label='아이디', widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label='비밀번호', widget=forms.PasswordInput(attrs={'class': 'form-control'}))


class UserRegistrationForm(forms.Form):
    first_name = forms.CharField(label='이름', widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(label='성', widget=forms.TextInput(attrs={'class': 'form-control'}))
    username = forms.CharField(label='로그인 아이디', widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(label="이메일", widget=forms.EmailInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label='비밀번호', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password2 = forms.CharField(label='비밀번호 재입력', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    avatar = forms.ImageField(label='프로필 사진:', required=False)


class NewHotel(forms.Form):
    title = forms.CharField(label='호텔명:', widget=forms.TextInput(attrs={'class': 'form-control'}))
    rooms = forms.IntegerField(label='객실 수:', widget=forms.TextInput(attrs={'class': 'form-control'}))
    cities = forms.CharField(label='도시:', widget=forms.TextInput(attrs={'class': 'form-control'}))
    location = forms.CharField(label='호텔 주소:', widget=forms.TextInput(attrs={'class': 'form-control'}))
    cost = forms.IntegerField(label="객식 당 요금:", widget=forms.TextInput(attrs={'class': 'form-control'}))
    short_text = forms.CharField(label='설명:', widget=forms.Textarea(attrs={'class': 'form-control'}))
    photo = forms.ImageField(label='호텔 사진:', required=False)


class DeleteHotel(forms.Form):
    hotel_uid = forms.CharField(label='호텔 UUID:', widget=forms.TextInput(attrs={'class': 'form-control'}))


class CommentForm(forms.Form):
    comment_text = forms.CharField(label="나의 댓글:", widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': 4,
        'placeholder': '댓글 입력하기'
    }))
