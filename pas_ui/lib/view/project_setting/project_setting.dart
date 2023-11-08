import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:pas_ui/viewmodel/project_setting_viewmodel.dart';
// 가로 : 80.w 높이 : 95.h

class ProjectSetting extends StatefulWidget {
  const ProjectSetting({super.key});

  @override
  State<ProjectSetting> createState() => _ProjectSettingState();
}

class _ProjectSettingState extends State<ProjectSetting> {
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
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          )
        ],
      ),
    );
  }
}
