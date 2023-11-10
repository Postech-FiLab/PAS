import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:sizer/sizer.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:pas_ui/viewmodel/project_setting_viewmodel.dart';
// 가로 : 80.w 높이 : 95.h

class ProjectSetting extends StatefulWidget {
  const ProjectSetting({super.key});

  @override
  State<ProjectSetting> createState() => _ProjectSettingState();
}

class _ProjectSettingState extends State<ProjectSetting> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hostController = TextEditingController();
  final TextEditingController _portController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel =
          Provider.of<ProjectSettingViewModel>(context, listen: false);
      viewModel.fetchProjects();
      viewModel.fetchResearchProjects();
    });
  }

  void createResearchProject() {
    final viewModel =
        Provider.of<ProjectSettingViewModel>(context, listen: false);
    viewModel.createResearchProject(
        _nameController.text, _hostController.text, _portController.text);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectsettingViewModel = context.watch<ProjectSettingViewModel>();

    if (projectsettingViewModel.projects.isEmpty &&
        projectsettingViewModel.researchProjects.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '프로젝트 설정',
            style: TextStyle(fontSize: 12.sp),
          ),
          Container(
            width: 75.w,
            height: 30.h,
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black, width: 1),
                    vertical: BorderSide(color: Colors.black, width: 1))),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, left: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Database(연구과제)',
                        style: TextStyle(fontSize: 5.sp),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal:
                                    BorderSide(color: Colors.black, width: 1),
                                vertical:
                                    BorderSide(color: Colors.black, width: 1))),
                        width: 30.w,
                        height: 20.h,
                        child: ListView.builder(
                            itemCount:
                                projectsettingViewModel.researchProjects.length,
                            itemBuilder: (context, index) {
                              final item = projectsettingViewModel
                                  .researchProjects[index];
                              return Container(
                                color: projectsettingViewModel
                                            .researchProjectIndex ==
                                        index
                                    ? Colors.grey
                                    : Colors.white,
                                child: ListTile(
                                  title: Text(
                                    item.researchName,
                                    style: TextStyle(
                                        color: projectsettingViewModel
                                                    .researchProjectIndex ==
                                                index
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  onTap: () {
                                    projectsettingViewModel
                                        .researchProjectIndex = index;
                                    projectsettingViewModel.projectIndex = 0;
                                  },
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project(학습 & 진단)',
                        style: TextStyle(fontSize: 5.sp),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal:
                                    BorderSide(color: Colors.black, width: 1),
                                vertical:
                                    BorderSide(color: Colors.black, width: 1))),
                        width: 30.w,
                        height: 20.h,
                        child: ListView.builder(
                          itemCount:
                              projectsettingViewModel.filteredProjects.length,
                          itemBuilder: (context, index) {
                            final project =
                                projectsettingViewModel.filteredProjects[index];
                            bool isSelected =
                                index == projectsettingViewModel.projectIndex;
                            return Container(
                              color: isSelected ? Colors.grey : Colors.white,
                              child: ListTile(
                                title: Text(
                                  project.modelName,
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                onTap: () {
                                  projectsettingViewModel.projectIndex = index;
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Container(
                width: 55.w,
                height: 35.h,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.black, width: 1),
                        vertical: BorderSide(color: Colors.black, width: 1))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '새로운 연구과제 생성',
                                style: TextStyle(fontSize: 5.sp),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Colors.black, width: 1),
                                        vertical: BorderSide(
                                            color: Colors.black, width: 1))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '과제 이름',
                                            style: TextStyle(
                                                fontSize: 3.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                            height: 5.h,
                                            child: TextField(
                                              controller: _nameController,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'DB Host',
                                            style: TextStyle(
                                                fontSize: 3.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                            height: 5.h,
                                            child: TextField(
                                              controller: _hostController,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'DB Port',
                                            style: TextStyle(
                                                fontSize: 3.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                            height: 5.h,
                                            child: TextField(
                                              controller: _portController,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: createResearchProject,
                                          child: Container(
                                            color: Colors.lightGreen,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                '연결',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 5.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            children: [
                              Text(
                                '프로젝트 생성',
                                style: TextStyle(fontSize: 5.sp),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Colors.black, width: 1),
                                        vertical: BorderSide(
                                            color: Colors.black, width: 1))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 6.w,
                                            child: Text(
                                              '과제 이름',
                                              style: TextStyle(
                                                  fontSize: 3.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                            height: 5.h,
                                            child: TextField(),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 6.w,
                                            child: Text(
                                              '프로젝트 이름',
                                              style: TextStyle(
                                                  fontSize: 3.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                            height: 5.h,
                                            child: TextField(),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              color: Colors.lightGreen,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  '생성',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 5.sp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Column(
                children: [
                  Text(
                    '설정된 프로젝트',
                    style: TextStyle(fontSize: 5.sp),
                  ),
                  Text(
                    'test',
                    style: TextStyle(fontSize: 5.sp),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
