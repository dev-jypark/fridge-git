<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://kit.fontawesome.com/979888c264.js" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/insta/memberView.css"/>" rel="stylesheet">

</head>
<body>
	<header>

		<div class="container">

			<div class="profile">

				<div class="profile-image">

					<img src="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces" alt="">

				</div>

				<div class="profile-user-settings">

					<h1 class="profile-user-name">janedoe_</h1>

					<button class="btn profile-edit-btn">Edit Profile</button>

					<button class="btn profile-settings-btn"
						aria-label="profile settings">
						<i class="fas fa-cog" aria-hidden="true"></i>
					</button>

				</div>

				<div class="profile-stats">

					<ul style="-webkit-padding-start: 0px;">
						<li>게시물 <span class="profile-stat-count">164</span></li>
						<li>팔로워 <span class="profile-stat-count">188</span></li>
						<li>팔로우 <span class="profile-stat-count">206</span></li>
					</ul>

				</div>

				<div class="profile-bio">

					<p>
						<span class="profile-real-name">Jane Doe</span> Lorem ipsum dolor
						sit, amet consectetur adipisicing elit 📷✈️🏕️
					</p>

				</div>

			</div>
			<!-- End of profile section -->

		</div>
		<!-- End of container -->

	</header>

	<main>

		<div class="gallery-container">
			
			<div role="tabpanel" style="border-top: 3px solid #95E1D3;">
				
				<div class="row">
					<!-- Nav tabs -->
					<ul
						class="nav nav-tabs col-md-offset-5 col-md-4 col-sm-offset-4 col-sm-5 col-xs-offset-4 col-xs-10"
						role="tablist">
						<li role="presentation" class="active"><a href="#insta"
							aria-controls="insta" role="tab" data-toggle="tab"><i
								class="fab fa-instagram"></i>&nbsp; 일반게시판</a></li>
						<li role="presentation"><a href="#trade"
							aria-controls="trade" role="tab" data-toggle="tab"><i
								class="fas fa-carrot"></i>&nbsp; 거래 게시판</a></li>
					</ul>
				</div>
				
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="insta">
						<div class="gallery" style="margin-top: 20px;">

							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="0"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url('https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces');">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>

							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="1"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-2.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-2.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="2"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-3.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-3.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="3"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-4.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-4.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="4"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-5.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-5.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="5"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-6.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-6.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="6"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-7.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-7.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="7"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-1.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-1.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="8"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-2.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-2.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>
							<div class="gallery-item">

								<div class="carouselGallery-carousel" data-index="9"
									data-username="visitsweden"
									data-imagetext="Photog rapher: @conny_ lundstrom If you want to visit Sweden to watch and/or photograph the northern lights."
									data-location="" data-likes="3144"
									data-imagepath="<c:url value="/img/article-3.jpg"/>"
									data-posturl="https://instagram.com/p/9_dViYwVWJ/"
									style="background-image:url(<c:url value="/img/article-3.jpg"/>);">
								</div>

								<div class="gallery-item-info">
									<ul>
										<li class="gallery-item-likes"><span
											class="visually-hidden">Likes:</span> <i class="fas fa-heart"
											aria-hidden="true"></i> 56</li>

										<li class="gallery-item-comments"><span
											class="visually-hidden">Comments:</span> <i
											class="fas fa-comment" aria-hidden="true"></i> 2</li>
									</ul>
								</div>
							</div>							
						</div>
						<!-- End of gallery -->
						<div class="loader"></div>
					</div>
					<div role="tabpanel" class="tab-pane" id="trade">거래 게시판에 필요한 내용</div>
				</div>
			</div>



			

		</div>
		<!-- End of container -->

	</main>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		
	<script src="<c:url value="/resources/js/insta/memberView.js"/>"></script>
</body>
</html>